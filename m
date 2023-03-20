Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECDF6C1CD8
	for <lists+linux-leds@lfdr.de>; Mon, 20 Mar 2023 17:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232970AbjCTQw7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Mar 2023 12:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231995AbjCTQwh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Mar 2023 12:52:37 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492AE2A144
        for <linux-leds@vger.kernel.org>; Mon, 20 Mar 2023 09:44:30 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id h8so49198742ede.8
        for <linux-leds@vger.kernel.org>; Mon, 20 Mar 2023 09:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679330667;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FeEIDHoB9o6g2lYpPuZ0KuSMMkKV5X2skedJzB7DuLA=;
        b=IWEi5HhJ9YeK4NE/eMIWMmkvcPz8PaLg0KjOnS6SKgmjaPsQo/68VVXemONuwDkWL8
         qOkg0JfkD4GmtiO7ys1NdDCGOBjAPAfPTawe6RMA9EOSMNi4Bnf1goRjIplm6JUyDfHy
         46sNx13iah4gHoyA0b6JSdyKfMUt/ytOF8P5SYdONZF9AlD5lgjljvmEQmUC4WQ+ZN71
         LChfi7nlr/EL4iwhl+Rf6iMxlsRdKsna0b3H9wbKRjGzy88Musb04sGtzcW9pKmzI4iD
         5MQvhdvEFgGbXyPcAluzFYvWgUN12CeBgMlvPgPkKLln2CtfzNV3zaeBGmmA/vC8EAkO
         ZWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679330667;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FeEIDHoB9o6g2lYpPuZ0KuSMMkKV5X2skedJzB7DuLA=;
        b=TgsittM4K8AY/2Gse8Yc4mieHr1EStDhettaOoAGzPCR5TdgB4OfoCHZgfymI3HpBK
         MvkO5VlHhbMlIUy4h+75dPy6k8fkjJsCc7yFe0SVH8GBQ+3LiZG7RKwxK2HzlxT8p7Bu
         P1NiCOeeZxEeVNhtZTjTrpEF22udVaA625qq4rJmWuyrtaduGktgKD6b7SZa0QeA+jzn
         N2Y1+6u6VbJYM83m7AA2fCZmTL0f6rGPGFG6hO7rqqcegxjSPbWMkrGYaYifeArRsdc9
         cmRdNe6IMrl0UMgpMQmNy8/PkV+TdaQN7gu4dIMQFRG1OtgrIZktA2Lb/EtnJgw5bUPK
         y8uQ==
X-Gm-Message-State: AO0yUKWiQzUbcjmyoYF0Pq2g8i5PwRzDmvT2RncCicjTsO/35SjirUsM
        GDX2t6sOLOttndpdbED8CbHTlw==
X-Google-Smtp-Source: AK7set857BiOBmKTujHh8csYwdRDVe6ekRDoWQXJtebx3wK/eM5YNJR8+TzIzezQsJdWFS3x5aPrSg==
X-Received: by 2002:a17:906:e87:b0:932:d831:8517 with SMTP id p7-20020a1709060e8700b00932d8318517mr9972153ejf.13.1679330666975;
        Mon, 20 Mar 2023 09:44:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:458e:64e7:8cf1:78b0? ([2a02:810d:15c0:828:458e:64e7:8cf1:78b0])
        by smtp.gmail.com with ESMTPSA id l19-20020a170906079300b00932ed432475sm3473631ejc.124.2023.03.20.09.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 09:44:26 -0700 (PDT)
Message-ID: <ea673f62-f462-a559-d0dc-0662efc60f9e@linaro.org>
Date:   Mon, 20 Mar 2023 17:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: leds: aw2013: Document vdd-supply
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230320141638.3378-1-linmengbo0689@protonmail.com>
 <20230320142103.3440-1-linmengbo0689@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320142103.3440-1-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 20/03/2023 15:22, Lin, Meng-Bo wrote:
> Document vdd-supply, a regulator providing power to the "VDD" pin.
> 

No. This device does not have VDD pin. I checked in datasheet.

Best regards,
Krzysztof

