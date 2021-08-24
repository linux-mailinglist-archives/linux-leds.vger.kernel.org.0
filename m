Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3683F68D7
	for <lists+linux-leds@lfdr.de>; Tue, 24 Aug 2021 20:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhHXSJ6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Aug 2021 14:09:58 -0400
Received: from mail-oo1-f45.google.com ([209.85.161.45]:46592 "EHLO
        mail-oo1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbhHXSJ4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Aug 2021 14:09:56 -0400
Received: by mail-oo1-f45.google.com with SMTP id z1-20020a4a2241000000b0028e8dfb83b4so3989971ooe.13;
        Tue, 24 Aug 2021 11:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z1Ldw/7QykczfItZEBVQjnnZY9GOVBvQ7vVN2RGjkZ0=;
        b=mL5Xu6lJawIX8Ir0gTftrQEF9131ffOTq32xX50RK9cWQPtwldjDRZ/Qswt5bvN8nw
         CecVR0yG+z7JS35ZqBU4eYu47DQ7hqrMwFpZvP/7xmMJDndvgT2PvJTGW14rouGE1EdT
         WOUo5hi1xUSqXW26uAsOcnP9eK47U4g+H3+kqwqVTfTYTRrrNPQ491Rjl+1Wz1yq+PVq
         iZd8vYvDshZRdEnnYQPZ/j4K5VlpW5Vcy1cMdq07S4KtG6l3BAevf2zng6qMWyZ+UfH4
         p+4mtPt3excxIeJCp54PQt+gDf72yP4EgJ2ZSaMmj9Ek/SYErS4EiDw3FJXY5MvfhflE
         1p+A==
X-Gm-Message-State: AOAM533vP4eU4ram5jRDYss4TkeaMgHCs8xTPJkKk7B93atZHENJbw61
        msDyb3w1s2iBXOLaiWmZKQ==
X-Google-Smtp-Source: ABdhPJwczXW8JEuE2ZgKdvZb2JsNpF1ymUYnQ4FlFifxTEhALyNNdVARmSKN3S+dCcSXY+Gr2BN+ww==
X-Received: by 2002:a4a:966d:: with SMTP id r42mr31081964ooi.11.1629828551290;
        Tue, 24 Aug 2021 11:09:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b25sm2503627ooq.6.2021.08.24.11.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 11:09:10 -0700 (PDT)
Received: (nullmailer pid 735381 invoked by uid 1000);
        Tue, 24 Aug 2021 18:09:09 -0000
Date:   Tue, 24 Aug 2021 13:09:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     luka.perkov@sartura.hr, linux-doc@vger.kernel.org,
        robh+dt@kernel.org, Max.Merchel@tq-group.com, shawnguo@kernel.org,
        linux@roeck-us.net, krzysztof.kozlowski@canonical.com,
        pavo.banicevic@sartura.hr, jdelvare@suse.com,
        linux-leds@vger.kernel.org, daniel@0x0f.com,
        geert+renesas@glider.be, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, goran.medic@sartura.hr,
        lee.jones@linaro.org, pavel@ucw.cz, arnd@arndb.de,
        sam@ravnborg.org, robert.marko@sartura.hr, linux@rempel-privat.de,
        devicetree@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH v9 1/7] dt-bindings: Add IEI vendor prefix and IEI
 WT61P803 PUZZLE driver bindings
Message-ID: <YSU1xRa7DZ3mjLeC@robh.at.kernel.org>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
 <20210824124438.14519-2-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824124438.14519-2-luka.kovacic@sartura.hr>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 24 Aug 2021 14:44:32 +0200, Luka Kovacic wrote:
> Add the IEI WT61P803 PUZZLE Device Tree bindings for MFD, HWMON and LED
> drivers. A new vendor prefix is also added accordingly for
> IEI Integration Corp.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Signed-off-by: Pavo Banicevic <pavo.banicevic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      | 53 ++++++++++++
>  .../leds/iei,wt61p803-puzzle-leds.yaml        | 39 +++++++++
>  .../bindings/mfd/iei,wt61p803-puzzle.yaml     | 82 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  4 files changed, 176 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
>  create mode 100644 Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
