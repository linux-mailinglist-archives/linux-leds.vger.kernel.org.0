Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE500201D8E
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jun 2020 23:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbgFSV57 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Jun 2020 17:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728308AbgFSV5L (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Jun 2020 17:57:11 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACAFC06174E
        for <linux-leds@vger.kernel.org>; Fri, 19 Jun 2020 14:57:11 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id y13so11771185eju.2
        for <linux-leds@vger.kernel.org>; Fri, 19 Jun 2020 14:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=4h+TQ0BUZvdXDrH1AX5kjJUZRkkimnTcgDdIKfXb9w4=;
        b=sV/TnUNGxTDtCoo3/sVH99jPaBY9IV4J4FGtaw+TrGHgnNVwYoMU1YPQGTY2/Sj0l8
         3G38ogrSDCpubc4aUmcxQ+NQp+z0uBXSzrutyyLpDL9nNmtfNeEGrDyfK09P2XIVJim9
         yDNcPoaVS6barwdMP2Okg75hy7hfu3V3kcV5375uqYiEPb1mFBYtfdH0LCMNw6TZMEM1
         rgM22MmgsWnXO33Es/DfuewstJ3s3Px+vtPjMANjSRT/xtshF5xgodZwsc4TdUCOZT+H
         /M2IRuCV2UpeZKmhfiPl43J291ZZcTKiJUxNwKdlV/Fp7p5xP4/A4EYdk5gh+uoHXw1B
         cf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4h+TQ0BUZvdXDrH1AX5kjJUZRkkimnTcgDdIKfXb9w4=;
        b=OqC9RBZlozgCYGpPtv9LertEWJaasynf+b6R34L3fIBWyxPgb7KO7K6qtUX2aGsCRa
         cwhpT7phHkKBT+Cneqs0xWAhMm/f1x88gmFh2oD07k8vEYuIfUElK20yNzgyzWsNMhss
         UQQdYMXXKYciGYMDzkaWm2IQ3KvU3dF7H5zG0XdOvPnOmsuNHXpKE5JMhNAp4YyfysmX
         6I2sRvKb+kd+KOPSm2mc/5rXtz3BOk86B8N1IlvzH0WLQNl7LW9Vxk63CRli6crT8IIj
         wVj9e93u2vQYrboEo+femB4sKpY3vLmHITD6F7d6a6OExFuE3qJBvBLIzoKIwDBGA8HA
         Hk0w==
X-Gm-Message-State: AOAM531qH+4o87z/etKOgvqUmXbbp+du5/E5cwph2UHQcN8b1vcMvT2k
        pYEmcB55IG1Rmd9l97v8XFkMAAWw
X-Google-Smtp-Source: ABdhPJx2e6Cpn8VtMrIXqkN9hFw3opQMUivnE5MlQE9rBpVsDSDPUdDLHLRlPGxJShI6YesFUyTAhQ==
X-Received: by 2002:a17:906:f88a:: with SMTP id lg10mr1566331ejb.317.1592603829805;
        Fri, 19 Jun 2020 14:57:09 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:98c8:c0f7:fd90:a9ec? ([2a01:110f:b59:fd00:98c8:c0f7:fd90:a9ec])
        by smtp.gmail.com with ESMTPSA id 64sm5556582eda.85.2020.06.19.14.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2020 14:57:09 -0700 (PDT)
Subject: Re: Leds-gpio discarding the entries in /sys/class/leds : Linux
 5.4.38
To:     Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>, pavel@ucw.cz,
        dmurphy@ti.com, linux-leds@vger.kernel.org
References: <D70F5F6A-ECDB-41DE-AA3C-A2A93C9EC702@linux.vnet.ibm.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <124c90ad-e239-d5e8-4c86-be96e7aa7c26@gmail.com>
Date:   Fri, 19 Jun 2020 23:57:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <D70F5F6A-ECDB-41DE-AA3C-A2A93C9EC702@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Vishwanatha,

Please refer to Documentation/devicetree/bindings/leds/leds-pca955x.txt.

At first glance I don't get why you have gpio-leds node, which is for
leds-gpio driver.

On 6/19/20 3:34 PM, Vishwanatha Subbanna wrote:
> Hello,
> 
> I am Vishwanath, working with IBM and looking for your help on one of the issues that I am running into. Would really appreciate help on this. I run Linux 5.4.38
> 
> I have 2 number of PCA9552 chips, one on the Planar and other on the card that is optionally pluggable. The optional card must be plugged prior to booting and is not hot pluggable. In my experiment, I am running *without* the optional card plugged in.
> 
> In the device tree, I have a "leds {" section that looks like below for the PCA9552 that is on the planar and everything works fine and I can see /sys/class/leds/fan0
> 
>   leds {
>          compatible = "gpio-leds”;
> 
>          fan0 {
>              retain-state-shutdown;
>              default-state = "keep";
>              gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>          };
> };
> 
> &i2c7 {
>      status = "okay”;
> 
>      pca0: pca9552@61 {
>         compatible = "nxp,pca9552";
>          reg = <0x61>;
>          #address-cells = <1>;
>          #size-cells = <0>;
> 
>          gpio-controller;
>          #gpio-cells = <2>;
> 
>          gpio@0 {
>              reg = <0>;
>              type = <PCA955X_TYPE_GPIO>;
>       	};
>      };
> };
> 
> Similarly, if I update the device tree entry for PCA9552 for the card that is optionally pluggable, then I don’t see any leds entries in /sys/class/leds.

Please share your DT node after the update.

> I don’t even see “fan0” that is on the PCA9552 on planar also. I was expecting that I should see “/sys/class/leds/fan0”.
> 
> However, I could see all the entries in “/proc/device-tree/leds”.
> 
> Data from the failure.
> 
> [    7.895757] leds-pca955x 7-0061: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x61
> [    7.907659] leds-pca955x 7-0061: gpios 168...183
> [    7.913012] leds-pca955x 13-0060: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x60
> [    7.923486] leds-pca955x 13-0060: pca955x_write_pwm: reg 0x0, val 0x80, err -6
> [    7.931695] leds-pca955x 14-0060: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x60
> [    7.942138] leds-pca955x 14-0060: pca955x_write_pwm: reg 0x0, val 0x80, err -6
> [    7.950320] leds-pca955x 15-0060: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x60
> 
> root@bmc:/sys/class/gpio/# ls -l
> lrwxrwxrwx    1 root     root             0 Jan  1  1970 gpiochip168 -> ../../devices/platform/ahb/ahb:apb/ahb:apb:bus@1e78a000/1e78a400.i2c-bus/i2c-7/7-0061/gpio/gpiochip168
> 
> root@bmc:/sys/class/gpio/gpiochip168/device# ls -l
> lrwxrwxrwx    1 root     root             0 Jun  3 22:03 driver -> ../../../../../../../../bus/i2c/drivers/leds-pca955x
> drwxr-xr-x    3 root     root             0 Jan  1  1970 gpio
> drwxr-xr-x    3 root     root             0 Jan  1  1970 gpiochip3
> -r--r--r--    1 root     root          4096 Jun  3 22:03 modalias
> -r--r--r--    1 root     root          4096 Jan  1  1970 name
> lrwxrwxrwx    1 root     root             0 Jun  3 22:03 of_node -> ../../../../../../../../firmware/devicetree/base/ahb/apb/bus@1e78a000/i2c-bus@400/pca9552@61
> drwxr-xr-x    2 root     root             0 Jun  3 22:03 power
> lrwxrwxrwx    1 root     root             0 Jan  1  1970 subsystem -> ../../../../../../../../bus/i2c
> -rw-r--r--    1 root     root          4096 Jan  1  1970 uevent
> root@bmc:/sys/class/gpio/gpiochip168/device# ls -l gpio
> 
> Thank you,
> !! Vishwa !!
> 

-- 
Best regards,
Jacek Anaszewski
