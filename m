Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2438402DF0
	for <lists+linux-leds@lfdr.de>; Tue,  7 Sep 2021 19:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhIGRtk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Sep 2021 13:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345207AbhIGRtV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Sep 2021 13:49:21 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB22C061757
        for <linux-leds@vger.kernel.org>; Tue,  7 Sep 2021 10:48:14 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id m26so8761774pff.3
        for <linux-leds@vger.kernel.org>; Tue, 07 Sep 2021 10:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tlcos91zBbCY3ADL8GJyLeddK+6RZ2RnTWrnb/tvp3Y=;
        b=MmrTm2r+15KdX0nopH9HOAGBe57S4oTePNBCsfNwe0sDF/H/enavdbJxJVU2K+sHcS
         PRrQNI+nm1agMwzuX7G1gZ3EXvaHxWYtFR57/FJCfOvdzWgxdK3Iq3mQtjVhQvWeyRwS
         AwtpZPDHBVuRX7Z9aMkbFNkmYR0Xh86eitxeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tlcos91zBbCY3ADL8GJyLeddK+6RZ2RnTWrnb/tvp3Y=;
        b=svMPidFZCTgwxdJ05SNPL3Vx9lOx46SipBhibQnJRjcsWeMs4ogc/Ve9EST5R/ZOKa
         SgOTBeY653rIrKL+u3P2+zTRr/Mn86mjxiaUjMNZlataLJ3S7LtsKLznO+50cyor18KY
         ln6IoH6wemCjzO3a9DW/lv24abhPrUKjOe61kYZwvTlRGnOD7DLJxZ4mbeynKAIhbLwT
         NTXoDAweuSKLcDmcVGENnsFrgQpLxvq0w2THhht+vOBZ8mR+jaeGPpWXsS21sDa9Ok+E
         hQSPXH2bGUgAfksbxAtCaoFximYrvKQo6sBXPtMYwfvbQ8Xod/SjmS/zLAZZamE3UoYJ
         /wAQ==
X-Gm-Message-State: AOAM530a44VN7wDCVB8w+Ib9m5lCow/FIWPaKZP1uDW6oY3JZTe6ew50
        sqDu/jlNaJcQbn0k5FI0WOfOLA==
X-Google-Smtp-Source: ABdhPJzGkWqHMr6e4hfqWzVna21dN/+KfF8K4n8syUGpq8dAo62kw4og++aEOJetEgk8zhAc4ijo3Q==
X-Received: by 2002:aa7:984b:0:b0:404:fd28:1aca with SMTP id n11-20020aa7984b000000b00404fd281acamr17509107pfq.34.1631036894326;
        Tue, 07 Sep 2021 10:48:14 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c6b2:7ae:474d:36f6])
        by smtp.gmail.com with UTF8SMTPSA id r15sm11812922pfh.45.2021.09.07.10.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 10:48:13 -0700 (PDT)
Date:   Tue, 7 Sep 2021 10:48:11 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        swboyd@chromium.org, kgunda@codeaurora.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: leds: Add pm8350c pmic support
Message-ID: <YTel2zNSxDbERwH6@google.com>
References: <1630924867-4663-1-git-send-email-skakit@codeaurora.org>
 <1630924867-4663-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1630924867-4663-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 06, 2021 at 04:11:05PM +0530, satya priya wrote:
> Add pm8350c pmic pwm support.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
