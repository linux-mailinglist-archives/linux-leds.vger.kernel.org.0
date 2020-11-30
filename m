Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA3E2C8FB0
	for <lists+linux-leds@lfdr.de>; Mon, 30 Nov 2020 22:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387549AbgK3VMp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 30 Nov 2020 16:12:45 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:39240 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729292AbgK3VMp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 30 Nov 2020 16:12:45 -0500
Received: by mail-il1-f196.google.com with SMTP id q1so12749205ilt.6;
        Mon, 30 Nov 2020 13:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WxsxXvfuMvWF5lnBY7VRxT7Ln+DOtZrxCb5729Hx5GE=;
        b=OUF9tLIxbJZK8q+1LYTu2YBjNh4lFXEQMDA2/V7muiVoMSJmQHfp6VLqBrzuL258eE
         C5Fh2t2o0phqhwtGYg9PDJdH88g4p5Za8VnhBJLeu6eUO0/VsIRXhW2dQBl1UBAjAb4e
         EUm6bmHqv9Z5az2pr2oiuLytv1MCh05ZDVeCLwwHajiOFrNyUuHE1YI16u0kMu3mzCUj
         2JlLqm9UuqSdFAAw64DDZC7hV+22badgBEy0s02bqHCXbY/2OE6VU2VjhJtqN8G6Z1N+
         M573jgls5Sqt11Z+EiyROcqgYvkvXRMmmZpZOppQ9/SkQ0Y1JNyPm5Kpdc7xdS3y6wEm
         uIdQ==
X-Gm-Message-State: AOAM533M0/CSSdLhL323X/zyOog/LAzKQjXSfn3uq/kx2chd1FRHs1Uq
        5BMgp+6byiSsqvb/bfPBlo6iGW5DeQ==
X-Google-Smtp-Source: ABdhPJw8TNihGk5KIKz2Y6ESbSW8iFmz1M+bCJhphdgM2aFwwEkkRA0LwfHHL5UB2FsRCdCoKVC3DQ==
X-Received: by 2002:a92:520b:: with SMTP id g11mr20335993ilb.14.1606770723876;
        Mon, 30 Nov 2020 13:12:03 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id u12sm11224669ilg.10.2020.11.30.13.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 13:12:02 -0800 (PST)
Received: (nullmailer pid 3030088 invoked by uid 1000);
        Mon, 30 Nov 2020 21:11:59 -0000
Date:   Mon, 30 Nov 2020 14:11:59 -0700
From:   Rob Herring <robh@kernel.org>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     robh+dt@kernel.org, pavel@ucw.cz, cy_huang@richtek.com,
        linux-leds@vger.kernel.org, benjamin.chao@mediatek.com,
        dmurphy@ti.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com,
        jacek.anaszewski@gmail.com, Wilma.Wu@mediatek.com,
        devicetree@vger.kernel.org, gene_chen@richtek.com,
        matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v10 3/6] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Message-ID: <20201130211159.GA3030057@robh.at.kernel.org>
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606447736-7944-4-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606447736-7944-4-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 27 Nov 2020 11:28:53 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add LED_FUNCTION_MOONLIGHT definitions
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> ---
>  include/dt-bindings/leds/common.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
