Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4002C5997C4
	for <lists+linux-leds@lfdr.de>; Fri, 19 Aug 2022 10:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346630AbiHSIj3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Aug 2022 04:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346430AbiHSIjD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Aug 2022 04:39:03 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548DE52801
        for <linux-leds@vger.kernel.org>; Fri, 19 Aug 2022 01:38:33 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id d23so881243lfl.13
        for <linux-leds@vger.kernel.org>; Fri, 19 Aug 2022 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=JQ2N9eV/mruP1qSMZgYRsi1GRzzDw7XMn///n243wCM=;
        b=mXAeU1hnmu3RDZSvggxiZhPX9UyTK/m37afbgYDla183ruesKl1GGn/gWLCXUsbI65
         GA04DLL3rNxArt6xOf/hns+nR61Q0WDBAFYkBNhYWxmUAx03GwYrXBZmpO/tE7tHuDLy
         kSfna3qILRt9iqFECk4uBpxHqAiHaRl2YMSNVXXLgW1iPs3aQQkLCRwajTTrfOt9AY2v
         BIakiJ8bFYJNzZwWaEC+qvbEjK+Fi9b+oSOIwQdyusLsPAyYm/rQ9LP7M04EoZYhaZzP
         EOZK3uaysjRR4+v9/x5VF9C+v8/z2lOZ4PqbXwn6F3mdIeMCMmIFL7L2iA/WtDQoZ+mn
         rOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=JQ2N9eV/mruP1qSMZgYRsi1GRzzDw7XMn///n243wCM=;
        b=1kAbPkTNMkO/1KMVaJGxCFSOGWdUfkZfXGd9EZPpRLgSmDuKkmre37JsNzaJQ8wAp/
         Aaxg8lXUvgiSOCcYRQQAI4xc73Y9EOSqqW5SeDvQsxfnGqJTQx04rJqvyYXCdr8FoWg1
         gwp/lh3nuWXib9wPiAc5cyLryc2x2gD/2mM8I/jz3SX+8F4Ol14vmxoD3wsvdC2hOCfR
         qZXZuqzqtc2bBanNDmZvCjKa7G0WKsr7cHt0laDdIVi48xFwEwE0jdmAlZN6u4ckZGJp
         t3EIRO+hqT5jF/gqLIChw4Y/Y+H9KEXa2FOBjbu04tCdeidOfJ9lzhLfN4KEMeRP+WAj
         RhDw==
X-Gm-Message-State: ACgBeo1Dote4n20ctYcjfQFu9z07HbIhzKOjYaOlA5xHWXV9dB/lA9EL
        lOlWvlYPBLkaU7Mt7QX1ttPzgQ==
X-Google-Smtp-Source: AA6agR7XQLtf5C8sDKTMGWsCcCyQhHRZUaAHZw4i/jxd+22w5TqObnWVtjD5Kyad6FnvFg8m/lRPuw==
X-Received: by 2002:a05:6512:1594:b0:48d:25f2:a6d5 with SMTP id bp20-20020a056512159400b0048d25f2a6d5mr2405503lfb.238.1660898311725;
        Fri, 19 Aug 2022 01:38:31 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id z19-20020a2eb533000000b00261ba714b01sm294624ljm.77.2022.08.19.01.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 01:38:31 -0700 (PDT)
Message-ID: <ae1c301a-60e4-5112-6681-8896a7479207@linaro.org>
Date:   Fri, 19 Aug 2022 11:38:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] dt-bindings: leds: register-bit-led: Add active-low
 property
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220818172528.23062-1-pali@kernel.org>
 <f635d5a7-6817-cd62-e395-63e346775716@linaro.org>
 <20220819065620.wvmy3kigvvbwo4bo@pali> <20220819080814.GA6653@duo.ucw.cz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819080814.GA6653@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 19/08/2022 11:08, Pavel Machek wrote:
> Hi!
> 
>>> Although the question is - where is the user of it?
>>
>> I was planning to send updated powerpc DTS files with these
>> register-bit-led definitions after accepting dt bindings.
> 
> We need device tree people to ack them, first. But a note saying "this
> is for Turris Omnia router" would be welcome.

In general the process is one of:
1. Send DT bindings with driver and DTS changes,
2. Send DT bindings with driver in one patchset, DTS in second but you
mention the dependency.

You should not wait with DTS till bindings got accepted. Why? Because
for example we do not want bindings for stuff which never is going to be
upstreamed (with several exceptions, e.g. for other systems). Also
because we want to be able to compare bindings with your DTS
implementing them, so we are sure you described everything (especially
that you said running one command to install dtchema and second command
to make the check is not possible in your system).

Without DTS here how can anyone be sure your DTS actually follows the
bindings?

Best regards,
Krzysztof
