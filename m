Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FFF441B4B
	for <lists+linux-leds@lfdr.de>; Mon,  1 Nov 2021 13:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbhKAMuh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Nov 2021 08:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbhKAMug (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Nov 2021 08:50:36 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A515FC061714
        for <linux-leds@vger.kernel.org>; Mon,  1 Nov 2021 05:48:03 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id o14so27890264wra.12
        for <linux-leds@vger.kernel.org>; Mon, 01 Nov 2021 05:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AL5k2JdewjRBZ5f2p0EMLjqrmX5G9JETkHej/me+hB4=;
        b=cuN60vozotwfe8Zy+vXOuQDo8HHu+CNK6NowN5BKFo820PBHdHhawqkm05T4IvYMPR
         CVFa9itmIK2IYLWyB5nzda3aQN24HI4nx0eiZ0s722KsNqNRauMHbLnFy+snHBCh4/FC
         owEBgmsn+69F02dmGL23OM3trGLBJ4/Tr2+GRhMqvEJW1n/MuFO2y/7i2Uao0IYI2qZF
         8tzKY/+NXgSZfpg3dP2rCn4UieXGXPja89zaes90GzXkJI6xwH83q42nGEeIzaa6oXLa
         tqNdpZ1b9CE6Ud+hUdBS3QkPMhU+EeBz/Z77hGbLinU9xjALbVE0KcNfpDTyf7RgVZYM
         EILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AL5k2JdewjRBZ5f2p0EMLjqrmX5G9JETkHej/me+hB4=;
        b=zQm1k1FbkeQJLqbVJNwnWxvusufz6WO/UJ4z4TG7/UVyIRLFFshazYuzg58TmKerHQ
         aLWcDQ7ZbfOMdXGgNhHXbM/MSpbtdpj6d47W10jdJFNkSvtWJvPyxBulr8VzC+sX3juP
         rAzAygQo0GtYMCRGc76CSj6GNxn7bDAgR6aqRYlhXvepboBT0C2tcyUUP0cl84X9d3R+
         Z2zWMh6yvNAr5Momq76Ov49SlCL7PAFCQqIfWle7dTApMZ8lvd/iOQezN7ebHzP1t89h
         NZDzu9ORCiP6t4qor6vVyLyS0CR//Kb5FvyMnawXyh0Kt1gE1V0H/SdOeDGqUi7ZbG4a
         CX0A==
X-Gm-Message-State: AOAM532vZxJYp3YqGSlVmPJpncQmD3hobKypK/Is24d/ROUWEE3tN02O
        T8f+nNkwHE+lm63EQf1ZeX40X3/xhHk=
X-Google-Smtp-Source: ABdhPJxaGfT/dpVguzGuKC7r9MM+tzfCN86Lc+iRT6YhS/afNkXghoZJtd0LoFcsPhWOfzlxD+eOJw==
X-Received: by 2002:a05:6000:144a:: with SMTP id v10mr36632508wrx.161.1635770882305;
        Mon, 01 Nov 2021 05:48:02 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f1a:f00:7d73:a9fc:189f:a5e5? (p200300ea8f1a0f007d73a9fc189fa5e5.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:7d73:a9fc:189f:a5e5])
        by smtp.googlemail.com with ESMTPSA id 10sm2707649wrb.75.2021.11.01.05.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 05:48:01 -0700 (PDT)
Message-ID: <d98dd377-4a1c-8c57-e3e3-11c78475d1a8@gmail.com>
Date:   Mon, 1 Nov 2021 13:47:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] leds: Don't emit brightness set error message if LED
 supports hw triggers only
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
References: <f80b57aa-a542-1d6b-50d9-6de0520f2871@gmail.com>
 <20211101115910.GA2571@duo.ucw.cz>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20211101115910.GA2571@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 01.11.2021 12:59, Pavel Machek wrote:
> Hi!
> 
> 
>> Working on a driver for specific network LEDs that support HW triggers
>> only I got error "Setting an LED's brightness failed" when switching
>> to a different trigger. This is caused by call
>> led_set_brightness(led_cdev, LED_OFF) in led_trigger_set() because
>> both brigthness_set callbacks are not implemented. Let's suppress
>> the error message in that case.
> 
> Hmm... do we have such LEDs in tree? LED supporting only hardware
> triggers is kind of unusual/interesting/and I'm not really sure if we
> should have them in LED subsystem.
> 
This was when working on network LED support for r8169 where you can
select between a number of HW triggers only. IIRC the discussion how
to support such network LEDs didn't really come to a conclusion yet.
Having said that at least my work hasn't been upstreamed yet.

> Best regards,
> 								Pavel
> 
Heiner
