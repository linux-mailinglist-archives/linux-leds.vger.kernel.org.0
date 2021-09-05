Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9F9401064
	for <lists+linux-leds@lfdr.de>; Sun,  5 Sep 2021 16:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236733AbhIEOuN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Sep 2021 10:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236426AbhIEOuM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 Sep 2021 10:50:12 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9418CC061575;
        Sun,  5 Sep 2021 07:49:09 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so5366803otg.11;
        Sun, 05 Sep 2021 07:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ztCaVswOPKskYyeQONV8FTLsG0K1vcFD4jn0ZVgNSyw=;
        b=YC7DY7p5to8VVPfPOlyzXb0rENfMIoFQ2hvHZ4LJxELllplPXbQG99XE+pqcFhO/ft
         mFe80k46cIUhiUhavvrTgtyQuH4zIvYBpuS7L+9MHU1foAf9XYjxK0r+DoHp4pJail6j
         TGVpAXUcybg1EF/qQpM+LO0NamudH++fkAk6ApCjcYaalEBYqpNDluf+Z5gDHW/d8+xY
         vyDz1BEjstGgP4ad382iaF5BZeBGKSv004aGWf9kIlR/gHmVn0Cyayu/lD95GNZFAOxr
         m+UHnxyVpKQUfHByxtGCT4hBRFCNeTQUImcEepNr5jjEwXDBUe5tCPPA9+Irn2lzJ2ro
         LUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ztCaVswOPKskYyeQONV8FTLsG0K1vcFD4jn0ZVgNSyw=;
        b=NV52Gvf4uIMGNcu+kN0F3139ndmBFTJoEcrUpIXpyD3kcWNi+OwMkxQm+Hj7GISrzx
         VFghX3t7XKiFQf5XFfadgsJZ6P0WfakpPF6lGnug/gna/spkDOiMJs9db7WY1Wbzmm6e
         pUxOrFwfUsHzcWaB1xz6AdW8J/zKcmgGZZohKuN4hd7WfzQOhzy1RUQeIjTd+dOfCeWI
         rVe973orgebh6vj2n7GLt/wC+pqdUIuO/mgdivqilCz+HBadFPGDgv7lgwMM975pm11E
         rVrfMXfY5nNdTpg7CkkkTY8GTlloV7eVEGD1wUQokCSINxF0GbvizS5MTvBNo/j2XENH
         KUPg==
X-Gm-Message-State: AOAM532u80ZCQtPBw2bqGHZImCRUNzvG2NVOVwqf2yNCCmNnQBfWElBk
        hu6RpBEUK44Jsh+pTLa+NQo=
X-Google-Smtp-Source: ABdhPJwbxwJHIJ/f5Qb7hVFzlRK41fBOjc0GZ4EzfrZX1A/jpv1oMe4sNzpgA19O5HLySnIWzJD1Cg==
X-Received: by 2002:a05:6830:4411:: with SMTP id q17mr7667253otv.48.1630853348912;
        Sun, 05 Sep 2021 07:49:08 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id f25sm1213682otp.2.2021.09.05.07.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Sep 2021 07:49:08 -0700 (PDT)
Subject: Re: [PATCH 01/18] docs: Add block device (blkdev) LED trigger
 documentation
To:     Pavel Machek <pavel@ucw.cz>
Cc:     axboe@kernel.dk, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-2-arequipeno@gmail.com> <20210904062938.GA25286@amd>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <63839834-d383-d224-8bbd-d37c6803a68f@gmail.com>
Date:   Sun, 5 Sep 2021 09:49:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210904062938.GA25286@amd>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/4/21 1:29 AM, Pavel Machek wrote:
>> +What:		/sys/class/leds/<led>/add_blkdev
>> +Date:		September 2021
>> +Contact:	Ian Pilcher <arequipeno@gmail.com>
>> +Description:
>> +		Associate a block device with this LED by writing its kernel
>> +		name (as shown in /sys/block) to this attribute.  Multiple
>> +		device names may be written at once, separated by whitespace.
> 
> This is seriously strange interface.

It's the netdev-like interface that Marek described in an earlier note
(adapted for the fact that the trigger supports many-to-many
relationships).

> If you have directory with symlinks, why not use symlink() syscall
> instead of add_blkdev, and unlink() syscall instead of delete_blkdev?

I'd actually had that thought as well, but I didn't see any obvious way
to do that in sysfs when I looked.  If you know how to do it or know of
an example, please let me know.

If using symlink()/unlink() isn't an option, do you have a suggestion
for a less seriously strange interface?

Thanks!

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
