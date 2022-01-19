Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5414935B6
	for <lists+linux-leds@lfdr.de>; Wed, 19 Jan 2022 08:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352135AbiASHoF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Jan 2022 02:44:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351676AbiASHoE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Jan 2022 02:44:04 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CCDBC06174E
        for <linux-leds@vger.kernel.org>; Tue, 18 Jan 2022 23:44:03 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id q25so1787166pfl.8
        for <linux-leds@vger.kernel.org>; Tue, 18 Jan 2022 23:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wgsNFzNpSSdccSgxfw+zCKaHdZrvmLN4TxH4pmEqHFM=;
        b=p+cHoZyZ/KxchMwriiVowMDalr/duztSsP8wupwGCXnhLANZc8nlOxi8DRiXRCJMIe
         ThXD3VtztapjDQndPVMlgQCNBGdaB/6GtGter/A53dpnPy0/ro9sY23pR2hrOCNdpJ6x
         A4o4u75fhuW3Mo06+JGLmcZyvqLXji4TLjjrijhdVwv1S53EEBqkn8vl1ndTRxbd3dZz
         uybHANAtOcV/NY4/riEthmOAO/ZD0wmVB13Z8eWzwiHuCL/kM8zjRhZyQ+O10QzOw4WU
         8T8YqXxpWNqIHjpyLGArRjsnP8Y9EWKTmKSTB1lK98Rd0uAtb5HaP0a2q3DyQSfNmTwM
         RKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wgsNFzNpSSdccSgxfw+zCKaHdZrvmLN4TxH4pmEqHFM=;
        b=x9eFPCXA+w6PzAp5EvDA5sygszzfgZf+yTU7CcwTM/8yNp876KvUgvsC+H4zJjvixX
         4ZF75tjey1xLuNSbqHTEBt5/N7L8+yHaB/8SlLtjOtXDNZRYJnJnOeqoDQojhl94JPOO
         Trmyuins99Um7fI5Yvwa+jEc1kKIl7Zi3b6AnsI9a4+n1gl8386NSpP5PIZat+Un5p6s
         w0OY7qkeAwNd20dm7QsSb+zoZ2vu6pK3hK4R634GS8UsJgHsT0vMXGatzwFbbDQeEK8e
         1TyWNqOOQBwyrv5iSSrMaO3WJXuiACKlSPLzybVl5m1wTkN8kVaSfQ8L0hb+Jar4xkOm
         /e3Q==
X-Gm-Message-State: AOAM5317b8RgDDvgccTFeM7j+Y+y+QK/IRkvNr4FIMr/cvdUMwvJ/QFY
        M/6zc2VvtJSBYm3IODSpjOsNHA==
X-Google-Smtp-Source: ABdhPJyNKcbiEGUcgkz9zXpAgkBgubu/10nRg7X8eh23rlI2iY9kKxwwNMydTTsODjGuMFGY0jhtqA==
X-Received: by 2002:a05:6a00:88f:b0:4bc:3b4e:255a with SMTP id q15-20020a056a00088f00b004bc3b4e255amr29453525pfj.79.1642578242462;
        Tue, 18 Jan 2022 23:44:02 -0800 (PST)
Received: from localhost ([223.184.90.234])
        by smtp.gmail.com with ESMTPSA id g14sm16984301pgp.76.2022.01.18.23.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 23:44:01 -0800 (PST)
Date:   Wed, 19 Jan 2022 13:14:00 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Vinod Koul <vkoul@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Kalle Valo <kvalo@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
        linux-pm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-can@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
Message-ID: <20220119074400.rqldtq6wqo73lqqg@vireshk-i7>
References: <20220119015038.2433585-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 18-01-22, 19:50, Rob Herring wrote:
> The 'phandle-array' type is a bit ambiguous. It can be either just an
> array of phandles or an array of phandles plus args. Many schemas for
> phandle-array properties aren't clear in the schema which case applies
> though the description usually describes it.
> 
> The array of phandles case boils down to needing:
> 
> items:
>   maxItems: 1
> 
> The phandle plus args cases should typically take this form:
> 
> items:
>   - items:
>       - description: A phandle
>       - description: 1st arg cell
>       - description: 2nd arg cell
> 
> With this change, some examples need updating so that the bracketing of
> property values matches the schema.
> 

>  .../devicetree/bindings/opp/opp-v2-base.yaml  |  2 +
>  .../bindings/power/power-domain.yaml          |  4 +

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
