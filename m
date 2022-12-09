Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 684E564847D
	for <lists+linux-leds@lfdr.de>; Fri,  9 Dec 2022 16:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbiLIPCZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 9 Dec 2022 10:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbiLIPBT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 9 Dec 2022 10:01:19 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488DD7E83D
        for <linux-leds@vger.kernel.org>; Fri,  9 Dec 2022 07:01:18 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 1so7435194lfz.4
        for <linux-leds@vger.kernel.org>; Fri, 09 Dec 2022 07:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJzA05MwGNcflYjJYNuBrRj2+RRU7jABtE3nBftkWdQ=;
        b=KdP1RdmaMl2JqjYFykVCTHTeM0qz8Q3oCX9PGyFVR83pfY85tosGpd2JecdNloFV0q
         H7lxsTBJH4h0wEMuYe51KxNOGrrTMAZBjvePX3Ifm9SvYjpzwCgm0tMsugvoJixp04wn
         Xv5zp4NJ1y2kqflpO8zmy2+PQA5fsBhF41SVti8mI9RKe6gUv261JPXosaqGLgmmlSzp
         KXsoZHPn54j+eDnG7/a8a8S9VpdsmqbVfQqTqinUSiURlVjpENBjwTkNwhK3Bs4nQZtw
         IZ6FXgmZ8VtKUcNtxpw0fPVtyH/urZexmSzSDScKh8YqC9b3t4In97/g2fdk+4vA2zp4
         MQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJzA05MwGNcflYjJYNuBrRj2+RRU7jABtE3nBftkWdQ=;
        b=akLBBWkdunmA38ZDUmo5A24XoqLGbKrmKHWiwqe+4yFQIoQKVJFB4WoqmEK5fNVN/h
         MliDFegCUshMXwXaUxlKt+1r+WoEPmTjG3/b5YSySvMMZKBehHZ12lARZ0nFN72bW8NY
         Grqi3ESmiJ0/VLOezsJ6VtcltMlS6NzobEV2J7beFx1c/ch5zGYfRCJwsYEN2o42OEjd
         5jlYHFDP43XhZowMgZ6DD+Ua941nwXiDboXLBPLLoZllDm0+J+8UKXyLJ4dbF7QLLcjV
         OiQLH/7z0cRa2zwRnMParicuK+FByIX+rejcznLtwZ0WH5gA/lq+NcZ1D+ubuHg9sp+F
         51rQ==
X-Gm-Message-State: ANoB5pnbWhfxxk+s2/Z+WRQzuXzWjqeUnFwiUPQAdCtnkQcDt3HDjD1d
        LcgYV9O+TGTKEqswkq1TGJ1xAg==
X-Google-Smtp-Source: AA0mqf5WG0or+xIyHDOliiIM6VVP1kSsBSdGE/W5vP+LjJD4OkWazLGK22bZ0PkQ0vMtwxBSome9UA==
X-Received: by 2002:a05:6512:5c2:b0:4b4:fbf2:608b with SMTP id o2-20020a05651205c200b004b4fbf2608bmr1592508lfo.30.1670598076570;
        Fri, 09 Dec 2022 07:01:16 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d25-20020a0565123d1900b004b5701b5337sm290805lfv.104.2022.12.09.07.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 07:01:15 -0800 (PST)
Message-ID: <026eafce-86b0-c063-c397-d4b82f2dc35f@linaro.org>
Date:   Fri, 9 Dec 2022 16:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/3] dt-bindings: leds: spmi-flash-led: Add pm6150l
 compatible
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221209-fp4-pm6150l-flash-v1-0-531521eb2a72@fairphone.com>
 <20221209-fp4-pm6150l-flash-v1-1-531521eb2a72@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209-fp4-pm6150l-flash-v1-1-531521eb2a72@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 09/12/2022 14:54, Luca Weiss wrote:
> Add the compatible for the flash-led block found on pm6150l PMIC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

