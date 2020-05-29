Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69CAB1E8510
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2020 19:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgE2RgR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 29 May 2020 13:36:17 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:46945 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728062AbgE2RgP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 29 May 2020 13:36:15 -0400
Received: by mail-il1-f195.google.com with SMTP id h3so3251437ilh.13;
        Fri, 29 May 2020 10:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+vldnj1A/A3DB6U9SQBWonFdPuOH0+2SZoMnNU6BJCY=;
        b=II2Q3vIN8TseP2BdYARKsz50LyWiVH7k3ubfvt591B/r5ayZFYoBaYjIGSt4oEDsqH
         H38qJIgMAJBb7Mpuji6JMMatG5Qtd3Q3+r2fqVmdQTpBC1hSGt6ZpucTQQ/ACg1I5YwT
         sjGozx170hLitaZp64J68Pihmkq/7dLFckS+j8NHrMQrOwrzRs4y1xAZeE0oLEcECS/p
         EDCqvLqv28sfUXQ6Vmb4aBbmVI98hmaHVkgTJn9mjXoYeo5G/VWO4i5UZMCnuIhB2cvp
         uJXzJ2/R1tujvBK91hqM8/DjE8PbhiwogZbvEvBNZ2iL2K+zGZt4TU8Y8l4GJpnqUOPB
         lswA==
X-Gm-Message-State: AOAM533esXrcxeXrWlHHpGOa2S834o84RI0y42GVlsoLXKU635Vsd500
        lntslRILk1Njr7Lf/dXYrZ5m/0c=
X-Google-Smtp-Source: ABdhPJw0D9Aj4dJOagyxhADhUi0We3v2dIBpchp7r06PGdMsavEqNpTwmfpl5+OcDOLyr+R5c/ad9g==
X-Received: by 2002:a6b:7c45:: with SMTP id b5mr7568415ioq.31.1590773240343;
        Fri, 29 May 2020 10:27:20 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id p75sm5083828ilb.23.2020.05.29.10.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 10:27:19 -0700 (PDT)
Received: (nullmailer pid 2610380 invoked by uid 1000);
        Fri, 29 May 2020 17:27:18 -0000
Date:   Fri, 29 May 2020 11:27:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: fix macro names for pca955x
Message-ID: <20200529172718.GA2610321@bogus>
References: <20200526092052.24172-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526092052.24172-1-f.suligoi@asem.it>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 26 May 2020 11:20:52 +0200, Flavio Suligoi wrote:
> The documentation reports the wrong macro names
> related to the pca9532 instead of the pca955x
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  Documentation/devicetree/bindings/leds/leds-pca955x.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
