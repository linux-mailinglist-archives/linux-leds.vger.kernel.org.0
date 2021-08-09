Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2CD3E4913
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 17:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235551AbhHIPoc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Aug 2021 11:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbhHIPoa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Aug 2021 11:44:30 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51CCC0613D3;
        Mon,  9 Aug 2021 08:44:09 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id s13so14833446oie.10;
        Mon, 09 Aug 2021 08:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xfIEzWUDBcftZDUDyQ73IjKOk2KGqvXNnD8dGpW+rlo=;
        b=fGM1iJJHVlpNxWI4E4jrECgCUC9fj1LJN4tQd5aMWM8drsHKYuobXpvs7PM+20/uLW
         htmXBNzpuOX22Oka1iMVxhSLqs8kjJatkceELw9IA6JU4BNTzzMbzGY8vxiQhk3ZABZD
         w7Mo0juFgCqnLeNpLTLHxqDQjfTomEt19BrxQwYAdkBjrlungN6WAL2yngyna25ZIolj
         TZBMaACd8pNArZQ69dTDvNk5YY0UMTCtwwJlAb8zb3sJqdKs7AtDexgejWJapk9rVl6G
         bMHitrVWa5eWDuMGLg6R3x3SCdaBUCcH12Cq4P47tmiJ6u77rRcxkIeso1PIUnbkplmJ
         Z9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xfIEzWUDBcftZDUDyQ73IjKOk2KGqvXNnD8dGpW+rlo=;
        b=fGMj4f17m/wDLvwU2pB4ZukkDi0cC0Zmjd/KNjBqUA+cdwO6mM3yfTYEn52g+g3T0J
         aoa/60speo3yPhtj3sMizrBCOqox263EJVUO7MbASdk1Fntsmef/eBKZp67tZIJHPt13
         yRqEiP5V/7Y5nrCUb3XF3KroHwmN2k05W6+7uyVFhscerQN+v3XZ6zZvEcHofBtS7Q9l
         yGLbHqsbMI6PesXXUVNDeLohlfJszxhNE/avGpMzNT2IugyiekYolv/2p6tDbWBd6O4V
         Lny5BkNzKgHNH6pj+6Bg8g5kIMfWxT3GkHtVQ9gZ+gVNRXtNHtTfCKVbDKBK25cT3XFZ
         Ku2Q==
X-Gm-Message-State: AOAM530tHyNyOYZKsEMTUQj0KzpB6GHPdL0xgeWyxu86F+lL5eh7MuWx
        G9K+FOfSlJjSYPutpPlvN259nm8wk+tSOBZr
X-Google-Smtp-Source: ABdhPJxgLkeRKmS9D3bTDsoGfiCtg7u1A9LPfKTKFBxGvYxn21y3lO+KcKfy3DFFHST+BwHQFjM89A==
X-Received: by 2002:aca:59c6:: with SMTP id n189mr11814143oib.44.1628523849234;
        Mon, 09 Aug 2021 08:44:09 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id o11sm1342681otp.8.2021.08.09.08.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 08:44:08 -0700 (PDT)
Subject: Re: [RFC PATCH v2 05/10] block: Add block device sysfs attribute to
 set/clear/show LED
To:     Jackie Liu <liuyun01@kylinos.cn>, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
References: <20210809033217.1113444-1-arequipeno@gmail.com>
 <20210809033217.1113444-6-arequipeno@gmail.com>
 <d2322db3-992a-f9c1-53c4-39efc9d957a4@kylinos.cn>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <94f034a0-4c65-48d3-3eaa-a57ceb6a8ce3@gmail.com>
Date:   Mon, 9 Aug 2021 10:44:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d2322db3-992a-f9c1-53c4-39efc9d957a4@kylinos.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 8/8/21 11:21 PM, Jackie Liu wrote:
>> +// Returns a pointer to the first whitespace character in s (or a pointer to
>> +// the terminating null), which is effectively a pointer to the position *after*
>> +// the last character in the non-whitespace token at the beginning of s.  (s is
>> +// expected to be the result of a previous call to blk_ledtrig_skip_whitespace.)
> 
> These are not linux kernel style comments.

Do you mean kernel-doc comments?  If so, they're not supposed to be, as
the functions are not exported.

>> +static const char *blk_ledtrig_find_whitespace(const char *s)     ^^^^^^

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
