Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7237D401096
	for <lists+linux-leds@lfdr.de>; Sun,  5 Sep 2021 17:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237418AbhIEPeN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Sep 2021 11:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237646AbhIEPeN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 Sep 2021 11:34:13 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06CCBC061575;
        Sun,  5 Sep 2021 08:33:10 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id x10-20020a056830408a00b004f26cead745so5470938ott.10;
        Sun, 05 Sep 2021 08:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cGcGLZ09Cb7srzpoGeTxoImxwk7kToGpxM9Ljktv8NE=;
        b=LiooPkWUO1copMwTJWyJGa9YzlnfEOdvqaF64ghcP8cJy6Bm/T3A9B1RwO/uCfSGyg
         fuVedMeM0E55hKd6mSe4k5esshzlszHwCWsd+BT1aBptACYCPFHJhafy9zc44TTo2yMF
         XRoauAcoZSe816iF9PByJjBIjRWozYoOLjGb9YTVjyWSp4wKrGBIhL6ObihvrP2jz9Bc
         zFMRgFEQ7C6p4aO7WDZjBm/vDaJghVzYf2hXVfb4IAQHJo8LwlqwRresULwesvzrRXnG
         MrdL+C3/1CGNHa49k92l6WYzaDiz/+35fnaOKUymC1J4ZZSkIPUB05x/DD4aaZWXUrde
         Y1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cGcGLZ09Cb7srzpoGeTxoImxwk7kToGpxM9Ljktv8NE=;
        b=b62VJPpV6H98/TT6sSpMTuuJq+g018o0jY8LV5fzFVi3bPbuibVuQgnUoGFh9wF3fp
         nNAiqqJW8dat3SCgZhr2lCYH2Z3Ov6sM6q8sXg6nsVvUI2txAODRIvxD11kJmnPEiXsz
         H/TYsQn3/IveJNu/2Btk1XbdRCslfD1bmdiGNrceES+3bv9p6ATjCnKo8k8LCAb8bzag
         6aHV/t7kMHZRKXFHAxaDZNjMwKXX/fXW78IPFCGxgufRkDVJLmt/8rz9fYL3wqIKylEC
         UiiJwNUatgv8gsBWOgqwgQsaq3FjS6b4rXPcJsU4KAalPmwngwQA5B2RaLXMYpRTyoLh
         ILog==
X-Gm-Message-State: AOAM532Ikk7ArI4YvsQkxCj0ofSLEBy+ma71BszLfmFu17ZxVC3IOU1o
        DqREwie4+5zX11bRvr9hEcc=
X-Google-Smtp-Source: ABdhPJzP3ItusxcGHXk6RB10imBLWmi7xaND5CuiPUI3+b74doMdBdALvcir/5gRWR2iGqzvAloYxQ==
X-Received: by 2002:a9d:1b5:: with SMTP id e50mr7368417ote.76.1630855989289;
        Sun, 05 Sep 2021 08:33:09 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id v8sm1229765ota.16.2021.09.05.08.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Sep 2021 08:33:08 -0700 (PDT)
Subject: Re: [PATCH 15/18] ledtrig-blkdev: Add sysfs attributes to [un]link
 LEDs & devices
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, kabel@kernel.org
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-16-arequipeno@gmail.com> <YTMLVrCokErmYxEU@kroah.com>
 <2791db8c-9049-adbe-604e-ff010aef03fa@gmail.com> <YTTZbYOSZ1IJsj/b@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <06cd179e-b5d6-43ac-3402-26c30f3ecfed@gmail.com>
Date:   Sun, 5 Sep 2021 10:33:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTTZbYOSZ1IJsj/b@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/5/21 9:51 AM, Greg KH wrote:
>> It's really more of an error message for the system administrator.  So
>> as with my earlier note, dev_info() would be my preference.
> 
> Nope, dev_err() for real errors please.

Just to clarify, the error in this case is the system administrator
writing an incorrect value to a sysfs attribute (likely via a udev
rule), i.e. a "pilot error."

One of the reviewers of one of my RFC patch sets commented that those
should be INFO level at most.

So dev_err() or dev_info() for that sort of thing (always given that
only the root user has permission to write to trigger the error
message)?

>> The blkdev_skip_space() and blkdev_find_space() calls effectively find
>> the first non-whitespace token in the buffer (disk_name) and its length
>> (name_len).  If the buffer only contains whitespace (e.g. echo > $ATTR),
>> then name_len will be 0.
> 
> That's a crazy interface, as others pointed out, don't do that please.

As Pavel noted, it would be ideal to use symlink()/unlink() in the LED's
block_devices directory for this.  As far as I know however, sysfs
doesn't support doing that.  I'd be happy to learn otherwise.  I would
also welcome any other suggestions for a better interface for setting up
the many-to-many relationships that the trigger supports.

That said, I don't know what that has to do with blkdev_skip_space() and
blkdev_find_space(), which are just helper functions that I use to parse
the device name out of the buffer passed to the store function.
Ultimately, the store function does need to handle the case where the
system administrator (or a broken udev rule) writes an all-whitespace
string to the attribute.

I will try to restructure the code to make things more clear.

Thanks!

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
