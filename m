Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86AA06752B8
	for <lists+linux-leds@lfdr.de>; Fri, 20 Jan 2023 11:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjATKoM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Jan 2023 05:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjATKoM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Jan 2023 05:44:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B8EA6C45
        for <linux-leds@vger.kernel.org>; Fri, 20 Jan 2023 02:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674211414;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HRrN050GgXHRXbbu2KLh4d8G3uUBIckRfr97uwxP040=;
        b=Pbnb1POVh9A+SePVwiQDGV0O520Meqk1pYCwePvFHt45y2SLquE41G6q93hKZw/2vvKR7+
        LbXJBe6nfI/+Ic0SxOr2esjzktzGUKmLklo8os6O4Dhsm0Wo6ytVoJIvYfijc8VYFOVKOn
        6ivZmStlMJVh/Zp17qeJz2GGnr/Z+/o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-5fuiKaUWONmnwod1W7zy0g-1; Fri, 20 Jan 2023 05:43:20 -0500
X-MC-Unique: 5fuiKaUWONmnwod1W7zy0g-1
Received: by mail-ej1-f69.google.com with SMTP id sh37-20020a1709076ea500b0087760a6acceso3537205ejc.17
        for <linux-leds@vger.kernel.org>; Fri, 20 Jan 2023 02:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRrN050GgXHRXbbu2KLh4d8G3uUBIckRfr97uwxP040=;
        b=xIYx3W2/Ls5agVzwGd2bfsIlL+ryovIpgwIizhPELNASxdhFxEM1pQ40LO0EH1jBRb
         rOEttZFRfWMalIynFNeUSiXKNkoSeB2rEo68jnOj6hf8jXzvzb/QDJ89gvylchEu239o
         DjSKq7hrogMuCUZJ6t+lUbOBk4s5C3xoyTQXparuw/xe+CyNbLEdPg7SbM9Amji2XqAj
         4B2n8B/IUfZ5mUjBhGhyWsNIL+Hu/JSSgTLvDQmxZYZ91DMnNpRbQBDJzT4ZmUuEfwUn
         Pdh/uBMXOwwyPT4lZeh7B9worIFnJQXstdqW87W7a+hm6djsmcxnJSdh6zZxJOsL/J7I
         CLLg==
X-Gm-Message-State: AFqh2kpFZJyi1/x1reXopzVaae+Cs04FisjTp486jPzQ39BkM9H3Jhaw
        cHGM1YzwTpAcyJunB3LRM48yJKOkw/uYvXtlCSXelXgEvBdXXTTbdc+bL4J6SP8qkJaijMMw3eq
        cYFkX3Qy0qQhfoI9vnViH3g==
X-Received: by 2002:a17:906:2c49:b0:7c0:fd1e:972e with SMTP id f9-20020a1709062c4900b007c0fd1e972emr16808777ejh.46.1674211399362;
        Fri, 20 Jan 2023 02:43:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuJfsF0tTZl6ENN+WVUaG2RDJlxoNjReE/SLntnLila3nkrLcnCVXwSWNFe/ZZ+qTg0nC36Jw==
X-Received: by 2002:a17:906:2c49:b0:7c0:fd1e:972e with SMTP id f9-20020a1709062c4900b007c0fd1e972emr16808762ejh.46.1674211399143;
        Fri, 20 Jan 2023 02:43:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906059100b007933047f923sm17711093ejn.118.2023.01.20.02.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 02:43:18 -0800 (PST)
Message-ID: <815d6485-45f4-1f9c-0707-c2163ab32e0e@redhat.com>
Date:   Fri, 20 Jan 2023 11:43:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 06/11] media: v4l2-core: Built async and fwnode code
 into videodev.ko
Content-Language: en-US, nl
To:     kernel test robot <lkp@intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>
References: <20230119130053.111344-7-hdegoede@redhat.com>
 <202301200320.AbLvd1xh-lkp@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202301200320.AbLvd1xh-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 1/19/23 20:47, kernel test robot wrote:
> Hi Hans,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.2-rc4]
> [cannot apply to media-tree/master pavel-leds/for-next next-20230119]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/leds-led-class-Add-missing-put_device-to-led_put/20230119-210441
> patch link:    https://lore.kernel.org/r/20230119130053.111344-7-hdegoede%40redhat.com
> patch subject: [PATCH v4 06/11] media: v4l2-core: Built async and fwnode code into videodev.ko
> config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230120/202301200320.AbLvd1xh-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/adfeffb48aad34dd2148e22caaf13d67cd92c285
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Hans-de-Goede/leds-led-class-Add-missing-put_device-to-led_put/20230119-210441
>         git checkout adfeffb48aad34dd2148e22caaf13d67cd92c285
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    ld: vmlinux.o: in function `videodev_init':
>>> v4l2-dev.c:(.init.text+0x4c7c5): undefined reference to `v4l2_async_debugfs_init'
>    ld: vmlinux.o: in function `videodev_exit':
>>> v4l2-dev.c:(.exit.text+0x1f95): undefined reference to `v4l2_async_debugfs_exit'


Right, v4l2_async_debugfs_init + v4l2_async_debugfs_exit need
static inline stubs for when CONFIG_V4L2_ASYNC is not set,
I will fix this in the next version.

Regards,

Hans



