Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D324438983
	for <lists+linux-leds@lfdr.de>; Sun, 24 Oct 2021 16:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbhJXO3w (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 24 Oct 2021 10:29:52 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:41969 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhJXO3w (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 24 Oct 2021 10:29:52 -0400
Received: by mail-ot1-f53.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so8673309ote.8;
        Sun, 24 Oct 2021 07:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=7ZnluDYvIgn2mPeO7loKd8KQYLBp7x1GGBhouOxlg4w=;
        b=DR0HEtqCTveRi8JBpLrgz4bqDJfe3hNbbnlULzgp2Qr/8aMAnEaxe3Urk152jhvYYq
         hBrZAg+MerATQFRWwnzdTJjbiHOsRqhMTDMVB4TGAwkBzqKVDs1yfDpCJUKC5IIUJ7rd
         Z5mehhOOOBAj/yIRYqkMX6bNs4yYCI5yaVHAQ7Yniij25Bu/ze5oVIWVATBa0oj6WNyV
         HExwpmnejAKQofDeFZfrwWk2Log9p+wwVDTFmdXHNTEbg75gURqSBPd7ugwExI+deTDm
         JbVZ3i9VaYIXTLWYAGEPVrxbMsDGIVZJOeamAMtHbuN/VcIUFNpSA9MpeNrH2QCozdag
         mKiA==
X-Gm-Message-State: AOAM531TK4Ozk6fvFT+g9pyt+Pq98R7RdLDR5Vo8chjEmNJXYsYx+fVC
        qBTRYcG7O5xp5EHwE7Q2Iedal/irZg==
X-Google-Smtp-Source: ABdhPJzIdapdWUsQJXaelWm9F2lq5jCsqUjlY2p/XyudCyuf3LflJ+X47JVL0jqvz90FaOMU2KTXEg==
X-Received: by 2002:a05:6830:3155:: with SMTP id c21mr9524673ots.104.1635085651160;
        Sun, 24 Oct 2021 07:27:31 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id be2sm3189972oib.1.2021.10.24.07.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 07:27:30 -0700 (PDT)
Received: (nullmailer pid 2015046 invoked by uid 1000);
        Sun, 24 Oct 2021 14:27:27 -0000
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20211024002358.225750-2-marex@denx.de>
References: <20211024002358.225750-1-marex@denx.de> <20211024002358.225750-2-marex@denx.de>
Subject: Re: [PATCH 2/2] dt-bindings: leds: Document mmc trigger
Date:   Sun, 24 Oct 2021 09:27:27 -0500
Message-Id: <1635085647.956792.2015042.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 24 Oct 2021 02:23:58 +0200, Marek Vasut wrote:
> The mmc subsystem supports triggering leds on card activity, document
> the trigger value here. The value is a pattern in this case.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-leds@vger.kernel.org
> ---
>  .../devicetree/bindings/leds/common.yaml      | 43 ++++++++++---------
>  1 file changed, 23 insertions(+), 20 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/leds/common.yaml:85:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1545330

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

