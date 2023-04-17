Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5896E5050
	for <lists+linux-leds@lfdr.de>; Mon, 17 Apr 2023 20:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbjDQSd5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Apr 2023 14:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbjDQSdy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Apr 2023 14:33:54 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AD346A8
        for <linux-leds@vger.kernel.org>; Mon, 17 Apr 2023 11:33:35 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2a7b08e84d4so15486901fa.3
        for <linux-leds@vger.kernel.org>; Mon, 17 Apr 2023 11:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681756414; x=1684348414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GloJ2SbV+VoPUOdGLkpUto0XVRhM3PdLse2vIr6qFYo=;
        b=Zh/Cx1qB8coVBnt43xqwLzMBrse8J9W4qQNgqLz2qcWWS5XHKKM5iCRbA6IzLk9exn
         5nlzFwQa7ZIAGauK5sURrdPwnOXllMCjIECF5WhflSITddVewm04bG1Ehd2FwyZ1hbml
         f6TwFYByCZl2ZGTxQtaHnV6ItqJSblx7ea5fsZwNLJ8XA+TL1/KoYwAVcZihWkkV9hwo
         mZu5DkneisGJ2FeSdkZxmj0J/2qZR2V5AEuT3AoAOtW90wgkl5hDrYz4XNGkl2PzvxLK
         RbvR/dZQ91007jBHRE7lB6cu/Q2ytdTYqr2U/LRIawa6okfmNIsNHrhEZPcdIJu0bQwH
         eTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681756414; x=1684348414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GloJ2SbV+VoPUOdGLkpUto0XVRhM3PdLse2vIr6qFYo=;
        b=EtQCacs7cRJ+pgHgxsxXoopMxYVyJCATo4x038mda2FLLEMLGfhNJPprgmb2Q3AiYN
         n04kmIC3+2605V95uStzyo7w/Qn/uaNTCIwcD8N3cIjrJFoAAYefQQy5dOzpXxG06AIk
         oRLlY2P0kmq0m9hYz/oRS6p6yLV8tx3sUck8GCJpWcbzrDYPozU7Ibc7Pwyc/HAy/flv
         B3o3teeCQxF+2QqRQr47h0+GLQxDlyNAzuOyhAg4HmsbwfaWYVBnuFTC8CSNN4mOCv8W
         p3QfxtuXonsh0CJE4lWKJdMpTStYJu7AWPgUrrE8qk+O5F3pQGV06pzsIBmDLHTH47js
         I5DA==
X-Gm-Message-State: AAQBX9dq7FkEZhQNn1Fu3nZwEBEA1A5Lj9SkGQ/ZfIRmHoyaTrCRQUS+
        gmyd4vdEntWgmckZfIVLXFpDOdJjH1c=
X-Google-Smtp-Source: AKy350Y6l0U7D7yRSP0l6Dri5kPmDWqYGruhjJwJ0FTj6ILOKWOMmy7NtI/uIdEcBCmMnlqc0Vwq4g==
X-Received: by 2002:a19:ad02:0:b0:4db:3a92:2c85 with SMTP id t2-20020a19ad02000000b004db3a922c85mr1504676lfc.67.1681756413636;
        Mon, 17 Apr 2023 11:33:33 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id v2-20020ac25922000000b004d85895d7e0sm2100331lfi.147.2023.04.17.11.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 11:33:32 -0700 (PDT)
Message-ID: <90efe25c-fea5-cdd0-8bd3-16b9e53e8b56@gmail.com>
Date:   Mon, 17 Apr 2023 20:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] leds: trigger/tty: Use led_set_brightness_nosleep() to
 set brightness
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        Florian Eckert <fe@dev.tdt.de>
References: <20230414164853.3668229-1-u.kleine-koenig@pengutronix.de>
 <ZD07hLV1gs+gw26s@duo.ucw.cz>
 <20230417124403.j64c2lftgyqo2a67@pengutronix.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20230417124403.j64c2lftgyqo2a67@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Uwe,

On 4/17/23 14:44, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Apr 17, 2023 at 02:28:52PM +0200, Pavel Machek wrote:
>>> After commit ba8a86e4dadb ("leds: trigger/tty: Use
>>> led_set_brightness_sync() from workqueue") this is the second try to
>>> pick the right function to set the LED brightness from a trigger.
>>>
>>> led_set_brightness_sync() has the problem that it doesn't work for LEDs
>>> without a .brightness_set_blocking() callback. This is (among others)
>>> the case for LEDs connected to non-sleeping GPIOs.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>
>> I don't think this is right.
>>
>> _nosleep calls _nopm, which assmues it can't sleep, and schedules
>> another workqueue to set the LED.
> 
> Then which is the right variant?
> led_set_brightness() and led_set_brightness_nosleep() set via a workqueue
> (which is bad) and led_set_brightness_sync() doesn't work for some LEDs
> (notably LEDs on non-sleeping GPIOs).

Can you remind me the context of this patch, why using workqueue is
bad here?

-- 
Best regards,
Jacek Anaszewski
