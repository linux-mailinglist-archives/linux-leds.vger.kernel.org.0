Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5469F5548D0
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jun 2022 14:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355102AbiFVIgT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Jun 2022 04:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354538AbiFVIgA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jun 2022 04:36:00 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194D838BFC
        for <linux-leds@vger.kernel.org>; Wed, 22 Jun 2022 01:35:51 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id eo8so22891725edb.0
        for <linux-leds@vger.kernel.org>; Wed, 22 Jun 2022 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LKVKNIti1LcRpv/jEhLMMKWh1ADREH2xijbZTCW6Xr4=;
        b=HTdEvAVx/Nof1YbJwQLyXd8dTkR/+m7SXUfhIdnvWqSKFFHyN4/nJbLZN7l3HUb/VL
         ejdoskCUL3HevZhUZLkymtquwxhwS0Yyk39d1zwHTft+vMf/6ece6uy7Z576XCZHwjYp
         gh+L1ynkZnUwloRiWvrQNH8vxZ5jeLFClRX1/m13hbqYB9RRh0PNgKJPNTNd5aHJ58iW
         NR51sWkbop9/ITHUdhlwLAMIjsnnEKDu1CXoCaNShIrzMmRdGlnwERlp0cTsgoMro4Lb
         2Q8QzCWCz2XGC/23fXWJrfKQHQpQcvBqVB+4FZAIG+OXNYDWUoh9bR0T7xC8FwWr7OaK
         htYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LKVKNIti1LcRpv/jEhLMMKWh1ADREH2xijbZTCW6Xr4=;
        b=eo5kkukEpAhcpu3MsdMYjenXVb70b8O8BxbDV8YrK3lqM+r64ea2+cJlPXwQ+1ZB9m
         Yv8BL7kjpdp8gGMiBFt9OiYAEtTOvH78KddDERRhKY6FEtDEELOGEGu6AiH51kWaVPHE
         ZBgpy23YIOgWCDx8I6/ZbzUeCEwqd58iTPAYCWgoBWwDthXNlZUQ4IUcpDY+ECGsq7yD
         m8fRBpUsHuJmyc8fW80zxzu9F/LRR3W+NB4JILJ3cuz/r328vfGOxpJPbOdodqHvRj6j
         NQBxt19abeveKle/YEqE7aFJ6hioe04ge62JSnGZXnuFXo4yEi82wsAWk6Su4TQziAK4
         sP9w==
X-Gm-Message-State: AJIora9oueOulqsJN9CxJskRXp1ifzzres1cXL0I+dRXG+p8lP8EsH5t
        IVQtqJk6gT/Z4DkjcdlbcCdqpA==
X-Google-Smtp-Source: AGRyM1ubdfO8px4g4kpPHR6o6PIPxQqkUkvACkcd7VlHI+hBIgv/8yaZr8ORCW2o1aIa03m0jnMdpQ==
X-Received: by 2002:a05:6402:358b:b0:435:828a:a403 with SMTP id y11-20020a056402358b00b00435828aa403mr2788497edc.117.1655886949582;
        Wed, 22 Jun 2022 01:35:49 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ku10-20020a170907788a00b00722e603c39asm1979733ejc.31.2022.06.22.01.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 01:35:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     kgunda@codeaurora.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, pavel@ucw.cz,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, krzysztof.kozlowski@linaro.org,
        jingoohan1@gmail.com, linux-leds@vger.kernel.org
Subject: Re: (subset) [PATCH 2/2] arm64: dts: qcom: correct SPMI WLED register range encoding
Date:   Wed, 22 Jun 2022 10:35:35 +0200
Message-Id: <165588692597.15720.6527539957529378086.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505154702.422108-2-krzysztof.kozlowski@linaro.org>
References: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org> <20220505154702.422108-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 5 May 2022 17:47:02 +0200, Krzysztof Kozlowski wrote:
> On PM660L, PMI8994 and PMI8998, the WLED has two address spaces and with
> size-cells=0, they should be encoded as two separate items.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: correct SPMI WLED register range encoding
      https://git.kernel.org/krzk/linux/c/2559f68b5991be168785a16a53f582862cf0063c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
