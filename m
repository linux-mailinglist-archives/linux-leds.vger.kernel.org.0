Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7333791248
	for <lists+linux-leds@lfdr.de>; Mon,  4 Sep 2023 09:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbjIDHe4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Sep 2023 03:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjIDHez (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Sep 2023 03:34:55 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD6ACD1
        for <linux-leds@vger.kernel.org>; Mon,  4 Sep 2023 00:34:37 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99c136ee106so172506966b.1
        for <linux-leds@vger.kernel.org>; Mon, 04 Sep 2023 00:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693812876; x=1694417676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hdXa4mrHl/rCBUCuTmE6oGWdTSGG32wB1sLBcKUuBZY=;
        b=emQfnitRnD87rsxgrCzhR+mz4qGBcF0geDCSymsFNvK5+0kIclnuylx6mdS08vxZWK
         NVAcF9A2fChMue0BaXRRaRHa8SCV8inN6uuQcuWChlrILGSbFpoK+9FX+Cg6EctZhRAv
         Cy5PLo20h6e96GHdZnrwNETC0hk/dkB6D8r5bRP0+VY947l7XaPJdzyYWV5zbHfA47nl
         e7n8ooMOmDzGExwDPrH3LKiWodt0UFEBXdDAXEam0PVtJxavdUuanDYrvUg+g5G3ZLB4
         lUgYWJphYmd2StjSnqP0PT8o9zxB4WKVuEsATqs3pegdvtRoK52aPv1RvYr12lvDPwp1
         doiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693812876; x=1694417676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hdXa4mrHl/rCBUCuTmE6oGWdTSGG32wB1sLBcKUuBZY=;
        b=aMOYF2lI3nPIZxGJ0ZzCJdd1YDrc8oydjqUuTHL+zgqykDkgr1o8+s5lTyPqYRxUgh
         b0sI91Lgbq+YYQQdn5P/ftxuSMLR11MZcqhi1Chw5gojRcZqu2E3E2IvkdqUAIOm5CKY
         X0CqkFUM4EPtqSTugCEQP54VnaxgfO5SVCofeXXAx7Z3V89TFYcWyyE4hN6Qe5VPcl9D
         RkGCZqwXZtGmFewbuS4jzJHouHA4OOZ0eYOqpoWa1yeC5BGwjfnlJMtu9D+BQQ4Mqe8S
         jsNTsVvdhVqCSALiLPUsuYe75Nup7tLwGhhs0PRQK0BML/uHVrr8it7NSqkX0LbV5pXH
         +r7Q==
X-Gm-Message-State: AOJu0YwcccZbJVc1GLBDF/7bTJHRDgf5ddmM07ho0jJCiDV8rH+eKZge
        S/Yk/npuOe34H/fiT9ETr2HncQ==
X-Google-Smtp-Source: AGHT+IHbWmAUROTewDWolOIgM3V2bpTgkoevsKI89Njs6MPM5Z5dpBn3JDym25bUXcQ7HOCTIhKUSw==
X-Received: by 2002:a17:906:295:b0:9a5:bce9:ffb7 with SMTP id 21-20020a170906029500b009a5bce9ffb7mr6704526ejf.19.1693812875875;
        Mon, 04 Sep 2023 00:34:35 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id gf20-20020a170906e21400b0099ce23c57e6sm5745528ejb.224.2023.09.04.00.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 00:34:35 -0700 (PDT)
Message-ID: <1b086e32-fa1f-815f-f326-ef4d13f6fbc6@linaro.org>
Date:   Mon, 4 Sep 2023 09:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add Kinetic KTD2026/2027 LED
Content-Language: en-US
To:     =?UTF-8?Q?Andr=c3=a9_Apitzsch?= <git@apitzsch.eu>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230901-ktd202x-v2-0-3cb8b0ca02ed@apitzsch.eu>
 <20230901-ktd202x-v2-1-3cb8b0ca02ed@apitzsch.eu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230901-ktd202x-v2-1-3cb8b0ca02ed@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 01/09/2023 23:19, André Apitzsch wrote:
> Document Kinetic KTD2026/2027 LED driver devicetree bindings.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

