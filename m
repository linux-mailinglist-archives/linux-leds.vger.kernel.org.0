Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9402D6EB7
	for <lists+linux-leds@lfdr.de>; Fri, 11 Dec 2020 04:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390850AbgLKDhM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Dec 2020 22:37:12 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40909 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391186AbgLKDhG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Dec 2020 22:37:06 -0500
Received: by mail-ot1-f65.google.com with SMTP id j12so7069818ota.7;
        Thu, 10 Dec 2020 19:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2YCw8mPj1l7lOOUQN8Gm4gmeF455YbujAM0oOrlkgbE=;
        b=TPrDIv4UqzZ9HT9rbr4tGkrdvAlNlROCKsq/ZVloEVj4q2TIlzXJJe9QRbiuoPS1hm
         VGBXUQ8BZJjvB6mfv6rwiablkkDn0DZgK4wRb0pyfs9ZbKc6gLTRYTpfTWMkPXT9Nv0Y
         LWS9CcTdn99h8H6zqi6t5AfG2OhMY8GqVYVo56ytJxLPMWXyNJtmYclO1vm/E6Iy8e0p
         xlmO4GYzkboHrvOTdUToqloMLWuqZ1tJL5wZabrJZema++NNBOG1e3qbMQH/v0qQe2er
         hiRUarahNaUT4GF2rScCrPlstIUIvOuPtgvt9MYYtRuM0mNt9hHnn8xwlkATH7hMBIkA
         uHRw==
X-Gm-Message-State: AOAM532M8f+RIG8Dh1fvdl1bUxzWgm4As2VUMWzaVi9+TnMKOwW9CcQO
        diHIHozaWbsHrWTxJZc4Ww==
X-Google-Smtp-Source: ABdhPJxFVPh9P9P0ZHVmYQhR/hbIoLZ1rNrT1zRHbmPx8R1rze/TvRPDhMvNzVSdbSB2eheEIHHPfQ==
X-Received: by 2002:a9d:1f0:: with SMTP id e103mr8424722ote.74.1607657784884;
        Thu, 10 Dec 2020 19:36:24 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r204sm1144158oif.0.2020.12.10.19.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 19:36:23 -0800 (PST)
Received: (nullmailer pid 3588674 invoked by uid 1000);
        Fri, 11 Dec 2020 03:36:22 -0000
Date:   Thu, 10 Dec 2020 21:36:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, cy_huang@richtek.com,
        linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
        devicetree@vger.kernel.org, jacek.anaszewski@gmail.com,
        Wilma.Wu@mediatek.com, linux-kernel@vger.kernel.org,
        shufan_lee@richtek.com, benjamin.chao@mediatek.com, dmurphy@ti.com,
        pavel@ucw.cz, robh+dt@kernel.org, gene_chen@richtek.com,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v12 4/5] dt-bindings: leds: Add bindings for MT6360 LED
Message-ID: <20201211033622.GA3588630@robh.at.kernel.org>
References: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
 <1607580057-4408-5-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607580057-4408-5-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 10 Dec 2020 14:00:56 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6360.yaml      | 159 +++++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
