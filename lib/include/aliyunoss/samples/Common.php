<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * 项目维护：oiuv(QQ:7300637) | 定制服务：火眼(QQ:278768688)
 *
 * This source file is subject to the MIT license that is bundled.
 */

if (is_file(__DIR__.'/../autoload.php')) {
    require_once __DIR__.'/../autoload.php';
}
if (is_file(__DIR__.'/../vendor/autoload.php')) {
    require_once __DIR__.'/../vendor/autoload.php';
}
require_once __DIR__.'/Config.php';

use OSS\Core\OssException;
use OSS\OssClient;

/**
 * Class Common.
 *
 * The Common class for 【Samples/*.php】 used to obtain OssClient instance and other common functions
 */
class Common
{
    const endpoint = Config::OSS_ENDPOINT;
    const accessKeyId = Config::OSS_ACCESS_ID;
    const accessKeySecret = Config::OSS_ACCESS_KEY;
    const bucket = Config::OSS_TEST_BUCKET;

    /**
     * Get an OSSClient instance according to config.
     *
     * @return OssClient An OssClient instance
     */
    public static function getOssClient()
    {
        try {
            $ossClient = new OssClient(self::accessKeyId, self::accessKeySecret, self::endpoint, false);
        } catch (OssException $e) {
            printf(__FUNCTION__."creating OssClient instance: FAILED\n");
            printf($e->getMessage()."\n");

            return;
        }

        return $ossClient;
    }

    public static function getBucketName()
    {
        return self::bucket;
    }

    /**
     * A tool function which creates a bucket and exists the process if there are exceptions.
     */
    public static function createBucket()
    {
        $ossClient = self::getOssClient();
        if (is_null($ossClient)) {
            exit(1);
        }
        $bucket = self::getBucketName();
        $acl = OssClient::OSS_ACL_TYPE_PUBLIC_READ;

        try {
            $ossClient->createBucket($bucket, $acl);
        } catch (OssException $e) {
            $message = $e->getMessage();
            if (\OSS\Core\OssUtil::startsWith($message, 'http status: 403')) {
                echo 'Please Check your AccessKeyId and AccessKeySecret'."\n";
                exit(0);
            } elseif (false !== strpos($message, 'BucketAlreadyExists')) {
                echo 'Bucket already exists. Please check whether the bucket belongs to you, or it was visited with correct endpoint. '."\n";
                exit(0);
            }
            printf(__FUNCTION__.": FAILED\n");
            printf($e->getMessage()."\n");

            return;
        }
        echo __FUNCTION__.': OK'."\n";
    }

    public static function println($message)
    {
        if (!empty($message)) {
            echo strval($message)."\n";
        }
    }
}

// Common::createBucket();
