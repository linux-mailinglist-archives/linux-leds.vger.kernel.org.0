Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF0071264F3
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2019 15:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfLSOgy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Dec 2019 09:36:54 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55723 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbfLSOgx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Dec 2019 09:36:53 -0500
Received: by mail-wm1-f68.google.com with SMTP id q9so5675011wmj.5
        for <linux-leds@vger.kernel.org>; Thu, 19 Dec 2019 06:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=AoW0ANcjhnWhVQy1nVWVlNehespmk84ZLnrhmIANeDA=;
        b=YK7LdqaacIifpKR43grXurOLS6lstMbGSX6yh9BiZsQbKGNAobIumTzzfI0vzVab3R
         BkL1DaoAW+buzNT46GZR1VAyTxwQHfe6Iqdri+qpsLkTm1jLnks+ua7+UCV5dwzRWpBr
         zHE1KRA4Iy2WKEJFJsjuikO4s1AxpUw2M4/JDE9e80qW+IzcNdabq4wW2jwE6Xy00jH5
         8JUp76OYneB+zZAZuHdXWgdWHsHIhMW2gicqtOp+PQxuKbTk7uEprMzGXTs55KHJtezM
         aAawLm+qXV4CRlSmp8cS3SguI+nL2u/3rdPi/AuPaXieEK/Qv5k6q+UklgBSCRaqY02x
         TROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=AoW0ANcjhnWhVQy1nVWVlNehespmk84ZLnrhmIANeDA=;
        b=hhQcA5/1LMol+xj4oLzX/8TUd2Nwb+IiHl6YtuY3wkqnpXZTaWw9W9VToGJkeMozXY
         pM0bVWJ1s7QYxq1NasjHTBrhjVcRdw1oRH1r2fDjNn+EmoStz4fiRJHNR/cDjPJKUWF8
         EiMXS5/a3FN28FQnDXr+Scsx0wIiTFJ7pTKS6+k8FtYda/urr9OFojVneJo2kJfkR87o
         hNNnfURS3Pqvwnw9wbKUEeD5mw5ImtEVweM5iRZ4ssxZ+emU4hJ9rGiLNVK9xotGU6M+
         erD6tivWc6SLAlbvmonGwKicb8Ak2lEEsNb/gURK2wKn3qBeseBH56wHbp+iHKibRjsv
         iDmg==
X-Gm-Message-State: APjAAAW/MPWQ19RZgqF3dkBr6nf9x3Ipq279M/WN82iyD8kVczFKj28z
        W1l8IcMW5cf+Y32KMRqMXYvinw==
X-Google-Smtp-Source: APXvYqzWCOPBrg4orgmeiuAAjBbDOGoPenNVv75ndLEhJ5dP0c89acYNuswyk6Faok6Xlh/8ZdFv0Q==
X-Received: by 2002:a7b:ce81:: with SMTP id q1mr10589381wmj.47.1576766208594;
        Thu, 19 Dec 2019 06:36:48 -0800 (PST)
Received: from dell ([2.27.35.132])
        by smtp.gmail.com with ESMTPSA id 188sm6700579wmd.1.2019.12.19.06.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 06:36:47 -0800 (PST)
Date:   Thu, 19 Dec 2019 14:36:47 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Subject: Re: [PATCH v7 02/12] dt-bindings: mfd: Document ROHM BD71828 bindings
Message-ID: <20191219143647.GQ18955@dell>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
 <702daeb9d8604e2feddd5f6f92b067a2d60d81ad.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
 <f9b0fbb7b898691d09ed8954e8df67cf3706aa96.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9b0fbb7b898691d09ed8954e8df67cf3706aa96.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 19 Dec 2019, Vaittinen, Matti wrote:

> Hello Mark, Lee, Rob
> 
> I just noticed we have a dependency here. This binding is referring to
> regulator binding - which was applied by Mark and is thus missing from
> the series. What's the best way forward?
> 
> On Thu, 2019-12-19 at 11:46 +0200, Matti Vaittinen wrote:
> > ROHM BD71828 Power management IC integrates 7 buck converters, 7
> > LDOs,
> > a real-time clock (RTC), 3 GPO/regulator control pins, HALL input
> > and a 32.768 kHz clock gate.
> > 
> > Document the dt bindings drivers are using.
> > 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > 
> > No changes since v6
> 
> //snip
> 
> > +  regulators:
> > +    $ref: ../regulator/rohm,bd71828-regulator.yaml
> 
> This file is missing from the series and is applied to Mark's tree.

Shouldn't matter.  I guess they're all heading for he same release.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
