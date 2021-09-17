Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893F741005F
	for <lists+linux-leds@lfdr.de>; Fri, 17 Sep 2021 22:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238365AbhIQUsU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Sep 2021 16:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhIQUsT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Sep 2021 16:48:19 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF38C061574;
        Fri, 17 Sep 2021 13:46:57 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so3469725otj.2;
        Fri, 17 Sep 2021 13:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WoqNgFTJec7KB1xJcVptJLUQ1iUnZql68H0dmM6kXyI=;
        b=gTWGfSrcb/YdOhOmoAYP7BA1x45BY4Q6yDQAUxJ+wUfoCoIjty41jj4YcNZR2ayX7+
         1D9lBpF+GYG/g6mYbxU9DlG1uwbY7fokYLWmIRBZ3EszN5A9QrOq7wnfDGwVFJmz7jhA
         Yxmnqqv5YxjlTyTlEO4BI6QjfWL6tKklFYojLLS9bXd9kIhwt978F4VjLNpkN8EK8VIU
         /0Wtii418u+UbelxXFu/CyF+9+qdg6T7P8nxJTbuZ+04vD0l3aSeARup/lIYXI4y9Q3M
         ZkbFR/YEPBkIfnr4bMeyh9OnDKGL1p4PQWlZxGqNMglH8pPbAO/Nhjx2VChUQUH9i/gd
         FP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WoqNgFTJec7KB1xJcVptJLUQ1iUnZql68H0dmM6kXyI=;
        b=ou5qPJ0WF4+QrrKttHPPAejIuH+xoDo222sHt74SMY3pq6h7jrsUIA8Pg1VaCAoOTf
         NKovx7EE+iNWNNb+4XnZhkMUwc9YDUnZKG3rrn5UF1n73DHN1Mae2ogLHZYr5o9DwB94
         9bc04xEOnlDFdU66rACVj8jzCXwzd/thxz7POyH1YWNvmVWYq0/GdIC1p74cwPC5XfYe
         ClYz4fbWS96HC1STs0Jkjp1HwxT5EANuIruXcVsk6gScmlKH5DqvCjrTDrgnuFUjs/Nx
         S/+lazHfH4EK/WLofQLH8O8MfJAmzhD4reKHDyOiyD8Wjo3yffibYx85ELbBqZEHKdKK
         KMZA==
X-Gm-Message-State: AOAM532aAIbnEA8J/r0+2vVDFUG9XR6utuQFbUDT2/6Rmm7c0SL5BVpm
        E09I/8fv+tl5MBd2NVegu2A=
X-Google-Smtp-Source: ABdhPJw4nSTlN1ujgHacFVi0Sz+yN7TaGvhAyZGz+FCOuHu7x9fGD3Tj47fQEBLQFsH4bskE6LXj1w==
X-Received: by 2002:a9d:7ac9:: with SMTP id m9mr11822718otn.244.1631911616567;
        Fri, 17 Sep 2021 13:46:56 -0700 (PDT)
Received: from [172.31.250.1] ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id m20sm1725534oiw.46.2021.09.17.13.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 13:46:56 -0700 (PDT)
Message-ID: <e09257e0-ce95-623c-3a04-cc033aa9fec2@gmail.com>
Date:   Fri, 17 Sep 2021 15:46:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 1/2] docs: Add block device (blkdev) LED trigger
 documentation
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>, hch@infradead.org
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kabel@kernel.org
References: <20210916202127.1216994-1-arequipeno@gmail.com>
 <20210916202127.1216994-2-arequipeno@gmail.com> <YUQzdyG+WWoiJ2I9@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
In-Reply-To: <YUQzdyG+WWoiJ2I9@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Combining 2 related threads ...

On 9/17/21 01:19, Greg KH wrote:
> On Thu, Sep 16, 2021 at 03:21:26PM -0500, Ian Pilcher wrote:
>> +What:		/sys/class/leds/<led>/link_device
>> +Date:		September 2021
>> +Contact:	Ian Pilcher <arequipeno@gmail.com>
>> +Description:
>> +		Associate a block device with this LED by writing the path to
>> +		the device special file (e.g. /dev/sda) to this attribute.
>> +		Symbolic links are followed.  Optionally, the leading "/dev/"
>> +		may be omitted.
> 
> No, please don't follow symlinks, stick with kernel names here,
> otherwise you have a mismatch between that and the list of devices in
> this file:
> 
>> +What:		/sys/class/leds/<led>/linked_devices

I did update the documentation to mention that fact.

Following symlinks is the behavior of blkdev_get_by_path(), not some-
thing that my code is doing.

As far as using kernel names, that would be my preference, but I simply
don't know of any way to do so with the existing block API.  To my
knowledge, there simply isn't anything like a blkdev_get_by_name() API.

This the reason that I added the "retry" logic to led_bdev_get().  It
doesn't prevent the system administrator from using a symbolic link (or
an oddly named special file), but it does make an unqualified name like
"sda" work if the expected special file exists in /dev.

However ...

On 9/17/21 00:53, Christoph Hellwig wrote:
 > On Thu, Sep 16, 2021 at 03:21:27PM -0500, Ian Pilcher wrote:
>> +static struct block_device *led_bdev_get(const char *const buf,
>> +					 const size_t count, fmode_t mode)
>> +{
>> +	static const char dev[] = "/dev/";
>> +	struct block_device *bdev;
>> +	char *dev_path, *path;
>> +
>> +	/* sizeof(dev) includes terminating null */
>> +	dev_path = kmalloc(sizeof(dev) + count, GFP_KERNEL);
>> +	if (dev_path == NULL)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	/* sizeof(dev) - 1 is compile-time equivalent of strlen(dev) */
>> +	memcpy(dev_path, dev, sizeof(dev) - 1);
>> +	path = dev_path + sizeof(dev) - 1;
>> +	memcpy(path, buf, count + 1);  /* include terminating null */
>> +	strim(path);
>> +
>> +try_blkdev_get:
>> +	bdev = blkdev_get_by_path(path, mode, THIS_MODULE);
>> +	if (IS_ERR(bdev) && PTR_ERR(bdev) == -ENOENT && path != dev_path) {
>> +		path = dev_path;
>> +		goto try_blkdev_get;
>> +	}
>> +
>> +	kfree(dev_path);
>> +	return bdev;
> 
> Please just required the user to put in the whole path and remove all
> this garbage.  There is no need to build your own broken wrappers around
> the VFS path resolution.

Please be specific about what is broken.

If you see an actual bug in the code, please tell me what it is.

If (as I suspect) you disagree with the basic idea of retrying with
"/dev/" prepended to the supplied path, please say that.

Honestly, I wasn't particularly enthusiastic about it in the first
place; it feels like something that should be done in user space.  I
wouldn't have included it if I didn't have to make a writable copy of
the buffer anyway, in order to trim a trailing newline.

I can certainly remove the re-check logic.  The end result will be an
API that is slightly less "user friendly" in return for saving a bit of
pointer arithmetic and a 5-byte memcpy().

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
