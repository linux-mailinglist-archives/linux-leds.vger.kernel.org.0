Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 994E7400CFF
	for <lists+linux-leds@lfdr.de>; Sat,  4 Sep 2021 23:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbhIDVDA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Sep 2021 17:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233263AbhIDVC7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Sep 2021 17:02:59 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00EBC061575;
        Sat,  4 Sep 2021 14:01:57 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id 6so3717816oiy.8;
        Sat, 04 Sep 2021 14:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VEHuDoUfCE6VqFZXP4UqY8g9FvmTBx9kjHodISyOnHE=;
        b=MroQRkqIDjfNJUwbMFccKnqfPUHUU30B1df7jJUgZ597rwQ2GvQdZeLJBJeO5WGt8+
         6G3IM/CcTT7DCYJktdXelzT20IHQrHUEAZFBeqpiBiGlCxlBDHerhPagKnwUFHq1h7NC
         Lzdr1PDQXZ5ZDp9byTn8TpwsuZ+vvNxWWFyR/v8qW17uBwVNAucaNAqxtX1OZbpTgp6M
         onCmckrSLzhFZQY7Lv2kInr3uYt/+JFhVcsosp9q9NE2+J7kXEEZevl86dA+Kjt/XSWF
         ojoh4ScNT0OnqaG+4ZBFEBbaK5v8SscssE5IA3CvuanW5TGOOT2HXMvmIWC/TEMPm3xt
         dRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VEHuDoUfCE6VqFZXP4UqY8g9FvmTBx9kjHodISyOnHE=;
        b=HR0/RQSpN7JTMMagHepx5iP+d2Yo0WXBGLC5c30sGR4jiRRNnbzHmIJsG9pcaY5bBQ
         S8DbjDn47d2X2HwLKxVm46sM+jfX/fW8eGLlwo2jSLUob9RN6sKt57r914xqN+FxTfa1
         wPzt0Y1pUP3crLSveMkJG7aq3sVxkZBGdg/z/KAgBuQpMzATzOxD/Gzvf4fqMdqkT/Zc
         s5roliAHHdPObw7NhKT1CSZaKrhjY4OynScQqNKiYKCJzNL8dMuhC96epnk9+DzTrmtz
         jz4TT95wuDZ7cWlefZNgJVctMpJ/lUvbbeClswu7hCxx+svMOl9PEvQ6Ltv/rxme62U9
         JtYA==
X-Gm-Message-State: AOAM533VSS8WFzbroqnwIrjR1s7HaDgkfJsXqD6FNKeetK8gUshVKLP/
        1Sa2TSWeSeODe6Razw/kcMK7GZZLiUfxoA==
X-Google-Smtp-Source: ABdhPJwdUnUWEFLsnJDxRIVKq0U8dmLokulG3rQrbda52bxG5Qqn0v2Rf4R2wi/ZeGTUM6BYu7+67A==
X-Received: by 2002:a05:6808:20aa:: with SMTP id s42mr3745554oiw.37.1630789317080;
        Sat, 04 Sep 2021 14:01:57 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id f17sm743380otl.24.2021.09.04.14.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Sep 2021 14:01:56 -0700 (PDT)
Subject: Re: [PATCH 17/18] ledtrig-blkdev: Add mode (read/write/rw) sysfs
 attributue
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux@vger.kernel.org,
        kabel@kernel.org
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-18-arequipeno@gmail.com> <YTMKwJUyKX3bxDuK@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <ceed6f65-6feb-b97d-7582-57dae6e4f838@gmail.com>
Date:   Sat, 4 Sep 2021 16:01:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTMKwJUyKX3bxDuK@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/4/21 12:57 AM, Greg KH wrote:
> Also, you are now allowing any user to spam the kernel log, this shold
> be a dev_dbg() call at the most, if it is even needed at all.  Same for
> the other pr_info() call in this function, please remove them all.

Greg -

A bit of a "philosophical" question, if I may ...

Is allowing the root user to "spam" the kernel log really a concern?
(The permissions on the attribute don't allow non-root users to write
to it.)

As a system administrator working with a sysfs API (or writing udev
rules to do so), I know that I appreciate having a meaningful message in
the log when something doesn't work.

Given that only the root user can trigger these messages, would you be
OK with dev_info()?

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
