Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6AE2803E4
	for <lists+linux-leds@lfdr.de>; Thu,  1 Oct 2020 18:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732342AbgJAQZz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Oct 2020 12:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732046AbgJAQZz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Oct 2020 12:25:55 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1BCC0613E2
        for <linux-leds@vger.kernel.org>; Thu,  1 Oct 2020 09:25:54 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id x14so6182836oic.9
        for <linux-leds@vger.kernel.org>; Thu, 01 Oct 2020 09:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2CSu/IScOCsPGM9c3D/eJ8Lgkh9FWTnZ0m8wgNmrDis=;
        b=Tzu3fz8JfB/jQSuQ4t9QSXrokC1//Gsu6pBqeSbFsF8tuI95mVDMacS2NQKhT86u31
         DHdVld2B0mgDAi/QPGpAL1QIahr/T135xg9YogX+xPThn3SwAIjC+jT4wtAa6hRFJvQ/
         ICPtno+uXU5AXJ/R7rD+neX3/UNBU9kFA3xyXXk9USZlxHEovWYBzIVRf7T1chvSTQKW
         72Eka+lUb8YIb2dOQpSrP5QRq+sYJPMR433ViLcZdEgtRUewcZx9H00+tgjGm5rKviiM
         F2pepolJfiV0j1SDnzWEoUEEuVPqkUP5uPQwAJD1SNezTry+V9Jz0J8ty7eoXi8Hbt0A
         bCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2CSu/IScOCsPGM9c3D/eJ8Lgkh9FWTnZ0m8wgNmrDis=;
        b=XhSnKNo+67Ta02PGv7MLiL4aSHGAUfx6xEprL5ohzY3y/rtrhzZDabFNPqTVv8bNSS
         rs9hbw+yotqv5v/xUnUA0A5GYBhKtOkSdN0WTkLTVE8wJMhDyir6wGrJvj39+ORnBNRf
         ob1rWxwnySZcQ9025kQ3cEyKqduk72iUPU6vJPa3fj6DbyzYmoKBLUeXCl1r6sB/BPYG
         g8Tozfd/Zw6I3Ivr8qYSHGWB0Ayfprrj2T6gGkUMt1aJh+CGhWunJweWgOLHWXwIjEKO
         kSJPZ4am0fp1NYaLIwxMDSuvhWp8X2eZByLSVDlaczDQPyQa4WcuNdLIX31iboy/wUFv
         k7hA==
X-Gm-Message-State: AOAM531HX/OfNEpuASGc24NmCrjqsgIMfsC3uqmSQjY1k+uP8TvhKlzy
        n9lZ1qUMSM18HyjV/+vcb1KUag==
X-Google-Smtp-Source: ABdhPJw+OAhkscZL4XJ+4yh17jZ20OcTK/+TigpL8uj7SnyX70PQGeUcLahBNiIX9VhdiOw+aJV5qw==
X-Received: by 2002:aca:f417:: with SMTP id s23mr480974oih.168.1601569554231;
        Thu, 01 Oct 2020 09:25:54 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f26sm1303860otq.50.2020.10.01.09.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 09:25:52 -0700 (PDT)
Date:   Thu, 1 Oct 2020 11:21:11 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Martin Botka <martin.botka1@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: msm8996: Add mpp and lpg blocks
Message-ID: <20201001162111.GA114373@builder.lan>
References: <20200929031544.1000204-1-bjorn.andersson@linaro.org>
 <20200929031544.1000204-4-bjorn.andersson@linaro.org>
 <424f7b71-fb7e-fb45-c449-987ec3578290@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <424f7b71-fb7e-fb45-c449-987ec3578290@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu 01 Oct 10:22 CDT 2020, Konrad Dybcio wrote:

> Hi, 
> 
> Just a nitpick: the title says "qcom: msm8996", whereas the file being changed is pm(i)8994.dtsi. This also applies to most msm8992/94 platforms, as the PMIC was used there too.
> 

Thanks for pointing that out, replacing msm8996 with pm[i]8994 would
make more sense.

Regards,
Bjorn
