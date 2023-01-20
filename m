Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C30767591F
	for <lists+linux-leds@lfdr.de>; Fri, 20 Jan 2023 16:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbjATPxC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Jan 2023 10:53:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbjATPxB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Jan 2023 10:53:01 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D313D928
        for <linux-leds@vger.kernel.org>; Fri, 20 Jan 2023 07:52:54 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id ud5so15056803ejc.4
        for <linux-leds@vger.kernel.org>; Fri, 20 Jan 2023 07:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h+mqBGsnYsfl5gbovrDBJk+/D271yS+3EShU67BT0kY=;
        b=IcQYS0lvoxoro5y7K43hy/acP9jHBPu0brkvfuI4E7Q0Wtryp29okS9/Uezmzd3Cui
         qExTaxw9TdbHn7mt7HFqveQgVmmpQMwU6dgYab5uYY5805pJ31iiYDnRMB7CfSec0/hs
         vuhcJj74Bd22sWK8LhifrFLwYDVowOffCOThSmmlWgungPVb3/UvDNywPa1cZdKJAeTu
         GHCbojgKSKN6xXGhVYR7jS3pdEmMAEtE6QnaFJtJGVGhmOYB3kZrCqE2r+EnSQ5qQvlF
         XGhaB4HFqhxFI/fMR3E/i+MgHflVYZ8aq26+96x3KReW6aWElwAyQK1hzRetf3oC6AGh
         a8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+mqBGsnYsfl5gbovrDBJk+/D271yS+3EShU67BT0kY=;
        b=YRXSikxvAlR2NWTYREw+v6pUlLdddL3v5jmgGlmgTN0x1X1D6l1aGmJ5IeSdtiqAEf
         4eNh2LGvY5ByK1vx/vocZARzRrPebSt0d7QdH+r37NaQdkM0wiQciobjToGb1ZyE7UPd
         ueHcScs3Sp2RLxOtW7hv/CN0JuCXxEcJ1ZeonOnVFUNShni5Ct9D1OzrnUaCDxUZUI41
         HIs38YNqFaOemy34erbJuHRgkcGqByH3nSRYckNVi6T/9B8Y20CFJ3U9Gy5f8h9KTc3G
         JPAMOljXzDGioYLzIiWEJjppbEBvYwkC08BCr7it51APNLU+2esuzNBh7GC/jaU4GZcA
         J74A==
X-Gm-Message-State: AFqh2krfDqHRIKnwJPYhUszk0t2ltpw8Bvv3pqz2hbL7DSgjmqm6dZ7u
        G2YuNZVwcGt/HdMdX0OoXJObeg==
X-Google-Smtp-Source: AMrXdXsLp/wCVL3ZEsscdFsVZKVcxKnzJ8LoiGJFJ/YfIWBALz0XMOSU1Ik26apw9EcLDd1OUqrwPw==
X-Received: by 2002:a17:906:6b8f:b0:877:74e6:67a4 with SMTP id l15-20020a1709066b8f00b0087774e667a4mr6151980ejr.47.1674229972637;
        Fri, 20 Jan 2023 07:52:52 -0800 (PST)
Received: from [192.168.2.9] (78-22-137-109.access.telenet.be. [78.22.137.109])
        by smtp.gmail.com with ESMTPSA id p5-20020a17090653c500b007ae32daf4b9sm18126480ejo.106.2023.01.20.07.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 07:52:52 -0800 (PST)
Message-ID: <98a87f2d-f6c3-1dd6-36b1-095e47a87aaa@mind.be>
Date:   Fri, 20 Jan 2023 16:52:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 2/2] leds: lp55xx: configure internal charge pump
Content-Language: en-US
To:     Lee Jones <lee@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, krzysztof.kozlowski@linaro.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230110092342.24132-1-maarten.zanders@mind.be>
 <20230110092342.24132-3-maarten.zanders@mind.be>
 <Y8qdX7QIQntPWuuA@google.com>
From:   Maarten Zanders <maarten.zanders@mind.be>
In-Reply-To: <Y8qdX7QIQntPWuuA@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


>>   
>> +	pdata->charge_pump_mode = LP55XX_CP_AUTO;
>> +	ret = of_property_read_string(np, "ti,charge-pump-mode", &pm);
>> +	if (!ret) {
>> +		for (cp_mode = LP55XX_CP_OFF;
>> +		     cp_mode < ARRAY_SIZE(charge_pump_modes);
>> +		     cp_mode++) {
>> +			if (!strcasecmp(pm, charge_pump_modes[cp_mode])) {
>> +				pdata->charge_pump_mode = cp_mode;
>> +				break;
>> +			}
>> +		}
>> +	}
> A little over-engineered, no?
>
> Why not make the property a numerical value, then simply:
>
>    ret = of_property_read_u32(np, "ti,charge-pump-mode", &pdata->charge_pump_mode);
>    if (ret)
>            data->charge_pump_mode = LP55XX_CP_AUTO;
>
> Elevates the requirement for the crumby indexed array of strings above.
>
> Remainder looks sane enough.

Thanks for your feedback.

I won't argue that your implementation isn't far more simple. The idea 
was to have an elaborate and clear and obvious devicetree, but that can 
also be achieved by moving constants into 
/includes/dt-bindings/leds/leds-lp55xx.h. Would that be more acceptable?

Maarten
