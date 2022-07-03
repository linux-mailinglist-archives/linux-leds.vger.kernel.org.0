Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4019256442E
	for <lists+linux-leds@lfdr.de>; Sun,  3 Jul 2022 06:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbiGCD6c (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 2 Jul 2022 23:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbiGCD5x (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 2 Jul 2022 23:57:53 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE91BC1A
        for <linux-leds@vger.kernel.org>; Sat,  2 Jul 2022 20:57:26 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1048b8a38bbso8773663fac.12
        for <linux-leds@vger.kernel.org>; Sat, 02 Jul 2022 20:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VCyTfnH8NjSlB3wEmVmV8+vhbVUl0hOr4poBEopVoGU=;
        b=ziliVqzxy9/dOwyks9UKmfls7XduSVgh+N+IrqkD3A0u3sXMbzU3JczzX6OH1WaANo
         CB72tXVOYtCU+j1mqaWhM4IPQOq+14fuPISKLGGJkjyBQvngZPGhrTEqw6dt1fXm56LS
         aVWn3H3aIyZBk4nvM0s2cdauUBXh2PHECe0oC9UWmmR538VZB94H39VvxLf18YU0eRzI
         ykK6FW5hgOffY39yEUbCQwa5SOYPzYjVXvcsfUIZHYJ0wmIVkCedfNY4pD30gV/bXtST
         kSwRIZ4S6nx90lkm4dxVMCM2kOceLEbljBQhh60YXB+yDnHL2u3w5n4MSVlabNX0euIh
         LC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VCyTfnH8NjSlB3wEmVmV8+vhbVUl0hOr4poBEopVoGU=;
        b=R/+67hlJUd7ZcRMCcFy51EKk79jdc2Hbgi78y02eUu47CtlQ77ceUBaJdqFiw4vbPO
         eJmm9Ydm3B0nVSbfo99Gfwa00HmVJMjjX1MfCw7UGyNOoo5oyWSpBxlEZFV3QWyEB3EM
         PSS6PPKmPRef0+T/TW+qval3oHSeKKOoPKpQ4vedqcAE2fs+NXP3z6u7rxZGX561DrLq
         iObUOwsk32ja72Qz+3uWMnNYsaJgbHfYbj3csZ+LymgLkGjVXsv4GCcI4zRYShcwi8Ga
         mVjyOHJsWkmiHeeQcVhM4YyIRn2ZqxL6uuDjGS+8owM1tPeNxuNgHxOc3vElWu54cq1l
         AKkA==
X-Gm-Message-State: AJIora965g/5vgh+A2xxKcO1U2HjVCGioQZkeR4tN/V9lmPWO/2G92l6
        cnNszRWn/KRYiw6GWzhOIqmmjw==
X-Google-Smtp-Source: AGRyM1tUe+bpIIrEEtZ/9Nb0bCXCTN+7KLHFUmOrWnqm3jYRBvbR6skQvCorgt/Z+fIn6n4ArzIUHg==
X-Received: by 2002:a05:6870:7097:b0:101:229:eb1b with SMTP id v23-20020a056870709700b001010229eb1bmr14324564oae.121.1656820646368;
        Sat, 02 Jul 2022 20:57:26 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-leds@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>
Subject: Re: (subset) [PATCH 2/2] arm64: dts: qcom: correct SPMI WLED register range encoding
Date:   Sat,  2 Jul 2022 22:56:22 -0500
Message-Id: <165682055968.445910.9322003122830573708.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505154702.422108-2-krzysztof.kozlowski@linaro.org>
References: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org> <20220505154702.422108-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
      commit: d66b1d2e4afc0c8a9eb267740825240b67f6b1d1

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
