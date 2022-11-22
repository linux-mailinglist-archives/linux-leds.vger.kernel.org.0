Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E08E5634A29
	for <lists+linux-leds@lfdr.de>; Tue, 22 Nov 2022 23:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbiKVWjj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Nov 2022 17:39:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235114AbiKVWjj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Nov 2022 17:39:39 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9554EC67E1
        for <linux-leds@vger.kernel.org>; Tue, 22 Nov 2022 14:39:38 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id r81so12036567iod.2
        for <linux-leds@vger.kernel.org>; Tue, 22 Nov 2022 14:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bmk+scxqVxYs6oXV7GDflGOttyPDBA4RMUmP6u7aS30=;
        b=NHoQcvNHJpe0McPfic5H9vopmoFXyAIBFCbqI90QhOgg7dSGrof7cgpXC28EUK6mzU
         AsoehfBG8eiF+CSZ+nzOHSuEm2wJsg9JVCLsLwlnSarS7riIS0bWVhFReFRPjagnU9PQ
         EQy01M86S3TRVllqp5Tg5ZlnTRfutjRcj62GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bmk+scxqVxYs6oXV7GDflGOttyPDBA4RMUmP6u7aS30=;
        b=D2nlEwNMBG5aoRNuOWwK/RHU65VJ+CnTYJA01fx5w7LU1nj+QCvp+1ajgJSGoOyejN
         cu760JLYG5aFVkXRY9S5aq69jos4ZxGbp7S6SXGS9qXCpOGN4VvamSsJaZcEXFk8+25p
         thBCI1JpvxKL5m+0alHmpe5A3ZSVotlem5lhs26dam0grTUf+ynul9Xoe7vxygB5ydPt
         N60WEX/YicsnpAZI0Z0LMB8UKRUJwYre1AVwu7Nmnwhj+Ug3qXIb9IPNNLzLawotZyjq
         o1i/NUgjVbaAiCxtO20DPa4rt6vpRpeIdKiqllSDan0iMakMKu7cYxD0o0Dq5GPnOz++
         DdMA==
X-Gm-Message-State: ANoB5ply4urMXTVrMPiNrWQbfzLTyltD0CQJceKNcwtN+LqXgDCkLTEt
        1gfh40eXBpDo6o+2qxNv7ptNnw==
X-Google-Smtp-Source: AA0mqf5Fofwv+k8OO/M7Viav1NemCJkzMsZ4VmRb6MqnCqVEarg/NlKe8Qdxxe38J1XJeE0CjvnGBw==
X-Received: by 2002:a6b:c34b:0:b0:6de:3e40:7ec1 with SMTP id t72-20020a6bc34b000000b006de3e407ec1mr5028962iof.18.1669156777939;
        Tue, 22 Nov 2022 14:39:37 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id q17-20020a0566022f1100b006bbf0466587sm5758671iow.49.2022.11.22.14.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 14:39:36 -0800 (PST)
Message-ID: <a77c38d1-1633-5421-6fab-6886b642fe66@linuxfoundation.org>
Date:   Tue, 22 Nov 2022 15:39:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] leds: leds-wm831x-status: init chip_pdata before access
To:     Pavel Machek <pavel@ucw.cz>
Cc:     patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20221122204837.11611-1-skhan@linuxfoundation.org>
 <Y305hfVdhs9zwOi/@duo.ucw.cz>
Content-Language: en-US
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <Y305hfVdhs9zwOi/@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/22/22 14:05, Pavel Machek wrote:
> Hi!
> 
>> wm831x_status_probe() accesses status from chip_pdata before
>> initializing it. Fix it.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> Does it? ARRAY_SIZE() will be compile-time constant, no?
> 
> What is the bug? Did you test the code?
> 

Is ARRAY_SIZE() safe when accessing the status chip_pdata->status?
I wasn't sure. If so, this change isn't necessary.

thanks,
-- Shuah
