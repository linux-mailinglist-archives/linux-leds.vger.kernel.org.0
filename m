Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91405721629
	for <lists+linux-leds@lfdr.de>; Sun,  4 Jun 2023 12:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjFDKnP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 4 Jun 2023 06:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjFDKnO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 4 Jun 2023 06:43:14 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481CDB6
        for <linux-leds@vger.kernel.org>; Sun,  4 Jun 2023 03:43:13 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5149e65c244so5038352a12.3
        for <linux-leds@vger.kernel.org>; Sun, 04 Jun 2023 03:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685875392; x=1688467392;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i5UPSiRhw7Kb1ioCI8jbIaOe0UPM3r3g4sIFLqxBBck=;
        b=kW5FiO/O8vokLVZw4I6dsZ1bqK70cifNJWpxRC7NLg8O/00vnLe5g03jpKwoCXal6k
         bnB24PWNVO6VNxSj+xa96IOTyA0S2Nlam/ZD1uT/GIpl/vZojW7Wz1slexzhqOwAH3FC
         6ZIfZ26mUcAmTogp8pV+VDD5FPZ3848FGpBJ84PTyAMQvJgiV3t9IK3CIxYK//ycvLqc
         AodJzWOkLA+tGJg6j2m5GcxWWxBZtUT554XjZZaccfqd7k4wSssMeDIgr0ZBkMVWuzn4
         A3GIoftWvGKJO78WOj6x7wl5AoN1WY/ssksLjiEbTfvPtGT5/W9v8nIFigUZBMYuEmN+
         leEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685875392; x=1688467392;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i5UPSiRhw7Kb1ioCI8jbIaOe0UPM3r3g4sIFLqxBBck=;
        b=W+wf7hVs/MU2W5vDe4J0wCHHmxiG08q/91n4UVw37P7AGBvpOgymnq1jeqFpP4wg9W
         mfmdxuW50ilGxD9dln89J+TOy5x0o2QiesoPrqXDAqDzbEj1tyaAhd2bVi2t91vIMM4g
         Ul3q1EL+Jxnjo0bhgdmc1W+Lb34cr5XnJUrOL7HFCBYILrx7zV/iLFuOmHMYDzZDYszj
         lVaYbvkRvvbnTmuA5WAAI/vCDc2BrQMaVSyT7j9MK/ndDYMZvwy18C4hnoNEyYOLAQSs
         1p9/nu70+ItytNP9aTyPe/jeVjpPQMZfBpA8371WOgMKogQjs3plvXYFkZKu7Fxbp8gz
         Sl7w==
X-Gm-Message-State: AC+VfDxV+7dqgomLC3ELO/Keb+Ti9rAmWYbEAi8Fs0/RRa1TXwLEY0Um
        Uh5hV7czx6d0hrwHTBL7EveP2YPejku+G0XzTvY=
X-Google-Smtp-Source: ACHHUZ5QOZ/0P9lCxK0rMMgj+1R8tTsy+ETZ/GdUVA89JGiAuIl1Oh/l1GPulKXaugzHLBrzlAGZjg==
X-Received: by 2002:a05:6402:1509:b0:514:9e07:f33f with SMTP id f9-20020a056402150900b005149e07f33fmr5135381edw.20.1685875391803;
        Sun, 04 Jun 2023 03:43:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id p20-20020a056402075400b00514c4350243sm2614572edy.56.2023.06.04.03.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 03:43:11 -0700 (PDT)
Message-ID: <5cb59a5e-0ce5-7215-a14a-2ca2c1505b53@linaro.org>
Date:   Sun, 4 Jun 2023 12:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RESEND PATCH 1/2] dt-bindings: leds: sgm3140: Document
 richtek,rt5033 compatible
Content-Language: en-US
To:     Raymond Hackley <raymondhackley@protonmail.com>,
        open list <linux-kernel@vger.kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        "open list : LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
        "open list : OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, ~postmarketos/upstreaming@lists.sr.ht
References: <20230602133533.260502-1-raymondhackley@protonmail.com>
 <20230602133714.260556-1-raymondhackley@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230602133714.260556-1-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 02/06/2023 15:38, Raymond Hackley wrote:
> Add devicetree binding for Richtek RT5033 Flash LED charge pump used for
> camera flash LEDs.

What are the similarities? Same register interface? Same pins? It's not
obvious and your commit should clear explain this. It will be also
justification why you did not make devices compatible.


Best regards,
Krzysztof

