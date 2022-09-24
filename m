Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E284B5E8EED
	for <lists+linux-leds@lfdr.de>; Sat, 24 Sep 2022 19:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbiIXR2X (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Sep 2022 13:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiIXR2X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Sep 2022 13:28:23 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386A03C8FC
        for <linux-leds@vger.kernel.org>; Sat, 24 Sep 2022 10:28:22 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id m81so3577609oia.1
        for <linux-leds@vger.kernel.org>; Sat, 24 Sep 2022 10:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=AdPSORdNo1TjqrVgh35APtlNAS1co801O4Uw3ahLJkU=;
        b=n+uEChZ6wLfvCztHIvj0+hzWTD0BG+DFVCCL7I5jFCLsl+OWIW7TVfiCftfqwigNkc
         ifil0kRuqIf9bKDH81AfwS7KQbj41OGzJr4uyRHlfOFHg2uLH4x5f2FWJ27jZwiaxdQ5
         tLkALR1a4YgB8y6eZc2/uoKB0IY+wIYTEr4uVzVqspvDDbblP/2eoRyXqa/OoIOR/sbL
         mxtlqkJ/cuTsHnN4cMq2A9xZjikyESP7ifMHeLAvf+hfHFva5u71U41UNceVsADr17m5
         hhZQ5FFm+qb1LwbZCTZ1K/aTAhswzyqXRcQy80jSmySTC/jY3uoKwf7FJrORliRCIn3y
         MLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=AdPSORdNo1TjqrVgh35APtlNAS1co801O4Uw3ahLJkU=;
        b=wz2aYbym0ujmFyA8r0TuPTm+C/ry6xz74uAyCpAdjZ3VJsYYQ+ix/GGCj0Yu66lJ99
         25OLo8QMP6Kbx4vB/pzBDlKk9zETDTCkGay0YBsiZoQ59/KZWzYUvBFltVPO8dY7biEB
         V4ngoSao+1RK+UrOp6ca2Acn56eptcSkrZMo0YGWy1PjdEd/F2aCPBQh8s8XJNpk1gqc
         ZsCwTqc9pnTEFd6OEF7YiH1WORHcPzyMfuXW4jqnpOTOXBZ4B5M72J1AegllJbLVaCVr
         FdaFbJFuJaQpFBimOA7flJ5wHYPwxdcm1WsF3VV3JMDO4GxGV9bvEU5BqNVNWspk81JU
         Mprg==
X-Gm-Message-State: ACrzQf35iHgRGHjQkZtXmku8p2wFBlYZaX8vzri9R6w67THNxwvmZ3im
        IQwhNl1DbJZ8Nx6xkRrdAMXEYLLqqL8=
X-Google-Smtp-Source: AMsMyM5CiNFq/bnCMbPpV95bHM2NKhwgpAbHQBB54L++fWU+GhRRL/Jjoxbp9/lrLZiUiOcX84mb0g==
X-Received: by 2002:a05:6808:f88:b0:350:36e8:f29a with SMTP id o8-20020a0568080f8800b0035036e8f29amr11485343oiw.195.1664040501497;
        Sat, 24 Sep 2022 10:28:21 -0700 (PDT)
Received: from [172.31.250.1] ([47.184.52.85])
        by smtp.gmail.com with ESMTPSA id z38-20020a056870d6a600b00127ebb410a4sm6436544oap.11.2022.09.24.10.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 10:28:20 -0700 (PDT)
Message-ID: <ee73f8b1-8c5d-b24d-459c-e972efeeeeae@gmail.com>
Date:   Sat, 24 Sep 2022 12:28:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v11 1/2] docs: Add block device (blkdev) LED trigger
 documentation
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, kabel@kernel.org
References: <20220915205018.447014-1-arequipeno@gmail.com>
 <20220915205018.447014-2-arequipeno@gmail.com>
 <20220921110547.GC22654@duo.ucw.cz>
Content-Language: en-US
From:   Ian Pilcher <arequipeno@gmail.com>
In-Reply-To: <20220921110547.GC22654@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/21/22 06:05, Pavel Machek wrote:
>> +What:		/sys/class/leds/<led>/check_interval
>> +Date:		September 2022
>> +Contact:	Ian Pilcher <arequipeno@gmail.com>
>> +Description:
>> +		Frequency (in milliseconds) with which block devices linked to
>> +		this LED will be checked for activity and the LED will
>> +		(potentially) be blinked.
> 
> Frequency -> interval.

Will do.

>> +What:		/sys/class/leds/<led>/link_dev_by_path
>> +Date:		September 2022
>> +Contact:	Ian Pilcher <arequipeno@gmail.com>
>> +Description:
>> +		Associate a block device with this LED by writing the path to
>> +		the device special file (e.g. /dev/sda) to this attribute.
>> +		Symbolic links are followed.
> 
> Following symbolic links to paths written to file is "interesting".

This is the behavior of blkdev_get_by_path(), and I haven't been able to
find any other way to "resolve" a block device (struct block_device *)
from a name (and I have asked for suggestions multiple times).

>> +What:		/sys/class/leds/<led>/linked_devices
>> +Date:		September 2022
>> +Contact:	Ian Pilcher <arequipeno@gmail.com>
>> +Description:
>> +		Directory containing links to all block devices that are
>> +		associated with this LED.  (Note that the names of the
>> +		symbolic links in this directory are *kernel* names, which
>> +		may not match the device special file paths written to
>> +		link_device and unlink_device.)
> 
> As is mismatch between kernel names here and what names the other file
> expects.
> 
> Can we get something more reasonable?

The real problem is that there is no way to use a kernel name in the
first place.  I did think about using the last element of the path that
was used to create the link, but it doesn't really solve the problem
(because you still need to pass the whole path when you unlink the
device) and it introduces the possibility of duplicate names.

The cover letter for these patches say this:

> (I hope that if this module is accepted, it might provide a case for
> adding a "by name" API to the block subsystem.  link_dev_by_name and
> unlink_dev_by_name could then be added to this trigger.)

The one thing that I can think of is to go ahead and add an 
unlink_dev_by_name attribute, so the kernel names in an LED's
linked_devices directory could be use to unlink them.  (Once a device
is "linked", I can access its name.)

So there would be both _by_path and _by_name variants for unlinking
block devices from LEDs, but linking would would still require using a
path.

How does that sound?

-- 
========================================================================
Google                                      Where SkyNet meets Idiocracy
========================================================================

