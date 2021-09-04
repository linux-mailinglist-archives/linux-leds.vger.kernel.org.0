Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2CC400D5D
	for <lists+linux-leds@lfdr.de>; Sun,  5 Sep 2021 00:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbhIDWod (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Sep 2021 18:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbhIDWoc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Sep 2021 18:44:32 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1BCBC061575;
        Sat,  4 Sep 2021 15:43:30 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id k18-20020a4abd92000000b002915ed21fb8so808610oop.11;
        Sat, 04 Sep 2021 15:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K1KBH14ukRdTqfxlfcYpnpFAkXW2p3PaOBEyhrjt3Rs=;
        b=krFuniIcEKgkIVKBB130U6mKXmMpZJYZd0KFW0qsMFUIXW5/ZR9iQ+fkmyn612UUvZ
         iqUF3gslW5B0vbMbcetU+Cm/4+SgvEPePE3VqrOiL0PdPCHy/7PebIt6NaK8Iu8ISLd9
         GCQMdtXP2gCT/7KL0Y8Jrr10bxMa3XdqXkhgFgvA8u2qm5W3xNysAJ9NY2Bl861k1wTx
         YJlqTKe5Pf7h/P4ftGH1kQ2iwIf2uNYPQdsVhJIMnRNmM/cHpYoriPkd8B3+n6fd7g8E
         6E2QO6sSPBO2+mPFFohApq4gUvTjwv5kdeTdjV5SqTdG3/1+yYlyA0wKDsk4US9Xv+Cv
         wzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K1KBH14ukRdTqfxlfcYpnpFAkXW2p3PaOBEyhrjt3Rs=;
        b=Mf78fdfz8Qwb1sZAAH6AixtKvxeDWqINvwmQIhtbQf4K2fEE1iAK4BXYoy2aKcyvNB
         Kes6bLn+bmQ8jdZ3q1UwuqajOQatgOKndawtCpV2bcSPJ63I0IDUsdIRqcdDbsN1I2/D
         U1j+7hloMw7goYuR+TVLoVr2hpEFwKCpcnEy6GkNr+EELg4TFSw3WxfXwo9S8yDkBE6p
         rqbgVeSFLlXhMrvgocRi3GRB604HgyEuSkeDQfbWt7K/LW0sIserl9RrYrPkVzKTnM+R
         q6O/WoeR7A3znvPt7Q2xeRZTyy7XbIkPWQmpB/RyMvon0YLSAayZEQgvld/A562dnvVb
         8XSw==
X-Gm-Message-State: AOAM532aXiBLLNtmk8s4ySvrhuN6cYdfwnlQR0Oo9HwWH/915z/TzORK
        8xNwlbXw9/PCztBFRYvu9Dc=
X-Google-Smtp-Source: ABdhPJzecL7CPopjagtjkn7rHueLxNbP5Iz5na41HkDvQ09mHfeOTaPr8C6ednieHNXLUwlP4qpHgg==
X-Received: by 2002:a4a:d088:: with SMTP id i8mr8558728oor.68.1630795410221;
        Sat, 04 Sep 2021 15:43:30 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id o24sm688398oie.17.2021.09.04.15.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Sep 2021 15:43:29 -0700 (PDT)
Subject: Re: [PATCH 08/18] ledtrig-blkdev: Add miscellaneous helper functions
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, kabel@kernel.org
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-9-arequipeno@gmail.com> <YTMLmHBHas3ViJdM@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <4b903bfc-0756-ce67-d066-5be2ec5c986a@gmail.com>
Date:   Sat, 4 Sep 2021 17:43:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTMLmHBHas3ViJdM@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/4/21 1:00 AM, Greg KH wrote:
> Why are block devices odd and need to have spaces found in their names?

They aren't.  The functions are used to identify the block device names
within the buffer that is passed to attribute store functions, which may
contain whitespace.

> And are you sure we do not already have string functions that do this?

I did look a bit.  I can't be sure, but I didn't find anything similar.

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
