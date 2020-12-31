Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12D02E7EBB
	for <lists+linux-leds@lfdr.de>; Thu, 31 Dec 2020 09:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgLaIeD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 31 Dec 2020 03:34:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgLaIeD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 31 Dec 2020 03:34:03 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF77C061573
        for <linux-leds@vger.kernel.org>; Thu, 31 Dec 2020 00:33:22 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id n16so3534799wmc.0
        for <linux-leds@vger.kernel.org>; Thu, 31 Dec 2020 00:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7CZya83atebnWeu1yHEbLA0a58aDtjoVw0Tiqu5x01A=;
        b=iPGHGeVR19yf0873nrpSscXEgUi6czdITxFf9XPnoJ9ABQczW4ok8EEnowhMbWE+RU
         83H9Egp/wsOFoyI0KgnI6TUetGDp2RmqGYnfmjcSh8IhiYc/95wOBL3Ze+nAeK+YEmPU
         30BbdPtfxtt8XqILPZFB4+EzKqmZ8y6T2jSUDbll+sIk2xB71at0b4XQHvfZ9E4NMyoY
         1r9+Vu9dT1US1yuzq/3QCdSwye6xV+yiudh/tO4R1ebQ8XkHxsjfPg+eo/2NQK3j+ELL
         PceYAOI3RTem7iJrRtgKxtYJrkRRJ5OG2EOn/dByp+36RCL1pUkuUKVuRZKNc4nkkVJ5
         JtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7CZya83atebnWeu1yHEbLA0a58aDtjoVw0Tiqu5x01A=;
        b=kHiwQiKFjR86Z9BOsd5tnYcEnLPjguErIOAisfxe/dEjJMI75XrinJrI8ZRZI7WjSB
         lupsCN5ZcPZ6NHnEceU2uO1i6Lm9vx0h0rgXVcILNEK4jhbWJ/Ufe9/krVBbE6ejlLCX
         A/ii9/+9jOvH/iBWMpFWfASxkY1FGO58Zm0rtM+dcig8GfDSV/vbS2ZI3v9ImpSJ9iSG
         Q/O7pEzPM7TZNT7zTZIp4e4J8nTnTzkHxQa1bHYFnvILjHqWPaxdcv7bJsU2hSaUscD9
         32x5I+x39gyW1rTXp7conExh6FVrfCBkflCtfdNxFYAnnnx19RHJef49nAxNNyeqWKHF
         gUOQ==
X-Gm-Message-State: AOAM533K1uSu7HLlS5dh9h5j3m5IURYD0M/6oSeSe44QGQuywgwLwpwq
        GAsYq9RGkh+2RWKh/lyCK9p41A==
X-Google-Smtp-Source: ABdhPJxgVpv6k0MI/BzifwYgB548pcGt6oqlux6TtaOZNi7+9Ao4+rwMet8Sf7IpouJnC+LD4ubqhA==
X-Received: by 2002:a1c:b407:: with SMTP id d7mr11034773wmf.34.1609403601033;
        Thu, 31 Dec 2020 00:33:21 -0800 (PST)
Received: from dell ([91.110.221.133])
        by smtp.gmail.com with ESMTPSA id z15sm71074287wrv.67.2020.12.31.00.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 00:33:20 -0800 (PST)
Date:   Thu, 31 Dec 2020 08:33:17 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Alexander Dahl <post@lespocky.de>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, Jeff LaBundy <jeff@labundy.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/4] dt-bindings: mfd: Fix schema warnings for pwm-leds
Message-ID: <20201231083317.GB4413@dell>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
 <20201230185439.GC25903@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201230185439.GC25903@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 30 Dec 2020, Pavel Machek wrote:

> Hi!
> 
> > The node names for devices using the pwm-leds driver follow a certain
> > naming scheme (now).  Parent node name is not enforced, but recommended
> > by DT project.
> > 
> >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
> >         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> > 
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > Acked-by: Jeff LaBundy <jeff@labundy.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> 
> Thanks, applied.

Sorry, what?

Applied to what tree?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
