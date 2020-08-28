Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C092562E5
	for <lists+linux-leds@lfdr.de>; Sat, 29 Aug 2020 00:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgH1WUi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Aug 2020 18:20:38 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:35474 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgH1WUh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Aug 2020 18:20:37 -0400
Received: by mail-il1-f196.google.com with SMTP id q14so1982396ilm.2;
        Fri, 28 Aug 2020 15:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=84tiJNvqXLzWGNNKW4M8qslA98P8c5Z+XOkx6/PTE94=;
        b=Gvg2Up2dBSUOnwl5REcqowZ2JYOnoEybsi1bhghEh1g1LdW8k/hZTdLM19fTMzwG9H
         sTgR1ClSlXOTdHJog8EwzdtEIUBgNIk5IFQAgqFmXUzuT6QMcZYqTWlpkJAxunvPGeqs
         HNtiZ4p3TISvum74JKTAzGh4dIe/g+XdEnmbMhqtYoQGpNn6FpB8WjOO95og4ZuI5evB
         Qab/fDdEs/FZAAxjLeox1OXabPyf1O6AlZ9rgG/Y4RHYSwlxnJidzhzp5DbcToIcIv0Q
         +UHg2CLdHJLKjlHky+mOSClDdL62TqiNqWzW8osUdiMLl4tWz8PYAyI0imi+NgPeJvU5
         nFLw==
X-Gm-Message-State: AOAM531Tuy0S0PWMDfQoV1D91+k4WkdHb2FcqcCvTG0Gc/cXHzJGaNLz
        91rX7c1Ud/+KkcvLvCTr+Q==
X-Google-Smtp-Source: ABdhPJzCtRKSR3U3/rpXQVJxYIvZY+tOqpqfk8joLqp/qOw1Q/Iywr+mAqA/6IsF4a2siLlyxHqGFQ==
X-Received: by 2002:a92:48da:: with SMTP id j87mr902382ilg.78.1598653236093;
        Fri, 28 Aug 2020 15:20:36 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id 3sm352652ily.31.2020.08.28.15.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 15:20:35 -0700 (PDT)
Received: (nullmailer pid 3507112 invoked by uid 1000);
        Fri, 28 Aug 2020 22:20:33 -0000
Date:   Fri, 28 Aug 2020 16:20:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Grant Feng <von81@163.com>
Cc:     linux-kernel@vger.kernel.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, linux-leds@vger.kernel.org, robh+dt@kernel.org,
        dmurphy@ti.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] DT: leds: Add an optional property named
 'shutdown-gpios'
Message-ID: <20200828222033.GA3506139@bogus>
References: <20200825082206.26575-1-von81@163.com>
 <20200825082206.26575-2-von81@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825082206.26575-2-von81@163.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 25 Aug 2020 16:22:06 +0800, Grant Feng wrote:
> The chip enters hardware shutdown when the SDB pin is pulled low.
> The chip releases hardware shutdown when the SDB pin is pulled high.
> 
> Signed-off-by: Grant Feng <von81@163.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-is31fl319x.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
