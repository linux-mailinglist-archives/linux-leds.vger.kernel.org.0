Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D475D2C8B35
	for <lists+linux-leds@lfdr.de>; Mon, 30 Nov 2020 18:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387673AbgK3Reb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 30 Nov 2020 12:34:31 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:39257 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387692AbgK3Reb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 30 Nov 2020 12:34:31 -0500
Received: by mail-io1-f67.google.com with SMTP id j23so12609937iog.6;
        Mon, 30 Nov 2020 09:34:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B8WQC1B/ybLTFuUDD6wQDsUH4CVJeOnw5YrNPlfBilM=;
        b=SAlTdO+BKoUU2E/WPkPUZ5j1CDH++PPUEPurEJIa/3HNlH2jwbX795IphBSp+kRZkj
         D8WVV75HZIviKnQxTThJPhECy1aySsCbGxwEdzrfwuxf067OTH7kAzsB8ox/FnJpBPsV
         USPWlA9zbotA1GdbN68Rb7wKKviO4lNs5jtbYnVunyEBNPt70JZpcO2FW+8otg5aTKQ+
         +zCi/ppaWrMFFd2CgzA2OOjRi4ymXYNu2Y+QnMJBaH27PAONHRH4L2h8+O0708e9I+g5
         81JwHJYzemXsXK7HLLguTTlHGDRChMrpMvNM7zuBt8dxvQvfTcKO26Zr2A8UepSYQW9u
         +d6A==
X-Gm-Message-State: AOAM532hLD2HwDikicDlshHWWCS5zAhicP17Q/rE9sH4n0uOQxhLfoM/
        FaIuE+GJnGbOFExw5w4yDA==
X-Google-Smtp-Source: ABdhPJywT5iLKdkjFtGlm/c/VnI4j+umxG0XmUInig+hKMPcQAtPBEa0/BK6Xapdk9l+dq7ClqR6oQ==
X-Received: by 2002:a5d:9753:: with SMTP id c19mr17155179ioo.111.1606757630169;
        Mon, 30 Nov 2020 09:33:50 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id q5sm7909850ilg.62.2020.11.30.09.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 09:33:48 -0800 (PST)
Received: (nullmailer pid 2679137 invoked by uid 1000);
        Mon, 30 Nov 2020 17:33:46 -0000
Date:   Mon, 30 Nov 2020 10:33:46 -0700
From:   Rob Herring <robh@kernel.org>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        Wilma.Wu@mediatek.com, benjamin.chao@mediatek.com,
        devicetree@vger.kernel.org, gene_chen@richtek.com,
        shufan_lee@richtek.com, dmurphy@ti.com,
        linux-mediatek@lists.infradead.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        matthias.bgg@gmail.com, cy_huang@richtek.com, pavel@ucw.cz
Subject: Re: [PATCH v10 5/6] dt-bindings: leds: Add bindings for MT6360 LED
Message-ID: <20201130173346.GA2678817@robh.at.kernel.org>
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606447736-7944-6-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606447736-7944-6-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 27 Nov 2020 11:28:55 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6360.yaml      | 164 +++++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/leds/leds-mt6360.yaml:57:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:


See https://patchwork.ozlabs.org/patch/1406971

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

