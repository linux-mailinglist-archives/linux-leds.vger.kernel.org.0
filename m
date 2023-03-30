Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA21B6D072F
	for <lists+linux-leds@lfdr.de>; Thu, 30 Mar 2023 15:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjC3Now (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 30 Mar 2023 09:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbjC3Nou (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 Mar 2023 09:44:50 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE779C
        for <linux-leds@vger.kernel.org>; Thu, 30 Mar 2023 06:44:28 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id h25so24570904lfv.6
        for <linux-leds@vger.kernel.org>; Thu, 30 Mar 2023 06:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680183866;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7dXaODJDga8CYetavWpa2GSFUuU4punKQn75AbRbTHo=;
        b=fGgdQkXtZ+Vg96kNl4Jfo4Ky/1Dwn2qcO7SAaOoYgQXgvvzGgD3vwjB+h9/LBphXRp
         YgDfsqtstG1oYIUVcS1YhT7ak60+f6S4pbedPMYlKMxOwJ+tAyizdW/vpsowNg4kV5B9
         butVVKT4ZHOt9Rdh8RAZv9cQ4HQbyLFvvhV9VUS6Z9vllXHyJ4F/uDYcPIoAX9Cx2hqw
         Qr63cj7i4PcSkLs84zU5vksKxud6bWUIkVQC2vt3iV6Keg4WruhFNbEsa77vZgK9UjF8
         0boXRnVr1xCi15P4XzXRZZ2AwJ0TN6YPbOhpwu14ncsZ/guWUyd3WIP4hjhMAlB1n2q3
         r+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680183866;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7dXaODJDga8CYetavWpa2GSFUuU4punKQn75AbRbTHo=;
        b=DLXasByuNco/6xFpIisCz78AfsBxqoo7OnJ8xEXhY4xcn7698YLRY+g0Vocbz9rhE5
         Ax4gJuGt0kFDkl7mI/A8jjeec5nFiugIm/TQt94uu0Z70sCZUAKWJuYGV1wos9vU1ADH
         +T9v4qvsgAV0G0uhf/Q9js/QM3PpI0phzzlPYCMdNWbLPRBE+laqfa8gD1YfKpybz062
         5AjZg/g8FSde9MidpgLaGwnCCq8KTt2WWJY8lULy7oK+HhnAdiPL2pTGBmxPc9q1WEAN
         Y27MaNoEXhaQ/GihcQ+/P2hkSbSWRQJ37AFQdzzj/ePNDn/QgJpnbsyPiJkSko3uKPEv
         zJEQ==
X-Gm-Message-State: AAQBX9c8HGstGKz0+zNEA88u21ygiXVECgDtUiNvfJcyAUMU4ExFF6Fn
        NL33vxKBduKkiqi3M7FUE1x9Aw==
X-Google-Smtp-Source: AKy350bVOd00ovsH5iQm9RMiEwmifowBDuv+HH+dRpAWlvbaxEV+uPUxMikMuJOtrsg8wMry14eXgg==
X-Received: by 2002:ac2:48a1:0:b0:4eb:2a26:babf with SMTP id u1-20020ac248a1000000b004eb2a26babfmr702020lfg.0.1680183866026;
        Thu, 30 Mar 2023 06:44:26 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m10-20020ac2428a000000b004b6f00832cesm5848545lfh.166.2023.03.30.06.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 06:44:25 -0700 (PDT)
Message-ID: <5eb0b699-47bb-ebb7-2ea5-0cf05ccf29ab@linaro.org>
Date:   Thu, 30 Mar 2023 15:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: leds: aw2013: Document vdd-supply
Content-Language: en-US
To:     Lee Jones <lee@kernel.org>
Cc:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230320141638.3378-1-linmengbo0689@protonmail.com>
 <20230320142103.3440-1-linmengbo0689@protonmail.com>
 <ea673f62-f462-a559-d0dc-0662efc60f9e@linaro.org>
 <20230330114633.GD434339@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330114633.GD434339@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 30/03/2023 13:46, Lee Jones wrote:
> On Mon, 20 Mar 2023, Krzysztof Kozlowski wrote:
> 
>> On 20/03/2023 15:22, Lin, Meng-Bo wrote:
>>> Document vdd-supply, a regulator providing power to the "VDD" pin.
>>>
>>
>> No. This device does not have VDD pin. I checked in datasheet.
> 
> I'm confused.  This patch set much do something?
> 
> I guess a better commit message would help.  Let me request that.

There was a v2 - with a discussion - so we wait for v3 which clearly
indicates this is supply on controller side. IMHO, this is still wrong
because it is controller's property, not device's, but Rob gave here
green light, so v3 with proper explanation would be fine.

Best regards,
Krzysztof

