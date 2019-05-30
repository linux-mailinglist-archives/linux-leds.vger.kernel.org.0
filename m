Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44AB72F7F9
	for <lists+linux-leds@lfdr.de>; Thu, 30 May 2019 09:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfE3Hic (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 30 May 2019 03:38:32 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41008 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfE3Hib (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 May 2019 03:38:31 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so3439654wrm.8
        for <linux-leds@vger.kernel.org>; Thu, 30 May 2019 00:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7nvQSt9u8hnEYp0RlBDRlIGBODePoq9QbKJNU2Z6R6I=;
        b=tYfDxhjHwopW10j/LxPwT+r0xzailTUFARfEDHBcC2xcwtT5AONzXsv/P+4QFLJDxQ
         extfmqu0pOByaM1XGJssrrcyVS0NsezxhOF+qaSlvoEtV/8rXBMoVlWtpYDGpRMVcrfQ
         6ljwDf4tDjC5ALOcHnrNFMK4O5yRdq3OfkxOSG/Hvl4A5W4QgXo9Teo8v1L6h81ThGZQ
         x34p3Ls/t5EQbukEgfFyaaS85GIqnPDEh7qyS4kcgBsl1d8yOi5Rd1osThsexsDcaMNT
         SumZ64jZ0dXTlozznClUyrp/hPGXPo2CvP1xyCCBIEpNnRnaUxJ0RvqhtcBv60pPBDu4
         e2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7nvQSt9u8hnEYp0RlBDRlIGBODePoq9QbKJNU2Z6R6I=;
        b=M8yxYVOnp+5zLlf4fa+PjNgr1a/aMnzqOv126GJfLAP2DxDw5OnF97H8onJxtVBV5X
         cipTQjpbBZV0Z8s3YySwPkOsI6ceFD076hBOIOJ3LIWByGVQrHrpWLaJYxb2Im5b/ZWc
         YiNW6cBar95XiFr9fNIumEyrNGn2dc4fxhsXaZqppXg019g87Lx/CV8sEILyssVJKWKQ
         TU8bNxVj/uIIRnZytNxC5kmUkYqCiapjwbXyBZ/k4DDh3Y0+uquj53eKXmaKTUNi03ak
         coSoA1A7R5g6yrXFtuiIll6h/8XN8cVepPeQwYQ+N8aDkJ3niVqRWgWx0LfFeRtnp1zy
         1vNw==
X-Gm-Message-State: APjAAAXzF881Bl9fAjDfTGLRXe8+0rpE7HcEqHga9qtH1wjP89163ZoW
        qNxg6X4NpPotS1kI5fRJV9TFkQ==
X-Google-Smtp-Source: APXvYqxhYpfaz8l4WfpxnWUASoy2MMApP6r2fgfNYHBXRruCpq9yut686jx+JIorQaP5E7LHF2WUrw==
X-Received: by 2002:a5d:694c:: with SMTP id r12mr1589045wrw.214.1559201909288;
        Thu, 30 May 2019 00:38:29 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id 32sm4553425wra.35.2019.05.30.00.38.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2019 00:38:28 -0700 (PDT)
Date:   Thu, 30 May 2019 08:38:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        broonie@kernel.org, lgirdwood@gmail.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274
 LED driver
Message-ID: <20190530073827.GL4574@dell>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-7-dmurphy@ti.com>
 <20190523125012.GB20354@amd>
 <0c2bd6af-92c5-2458-dc41-1ea413545347@ti.com>
 <89a80aa8-66ee-d0ec-fa54-c55ca8de06af@gmail.com>
 <20190529135821.GK4574@dell>
 <afff7c24-bb68-e9dc-295e-4449f9729cc9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afff7c24-bb68-e9dc-295e-4449f9729cc9@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 29 May 2019, Jacek Anaszewski wrote:

> On 5/29/19 3:58 PM, Lee Jones wrote:
> > On Fri, 24 May 2019, Jacek Anaszewski wrote:
> > 
> > > Hi,
> > > 
> > > On 5/23/19 9:09 PM, Dan Murphy wrote:
> > > > Pavel
> > > > 
> > > > Thanks for the review
> > > > 
> > > > On 5/23/19 7:50 AM, Pavel Machek wrote:
> > > > > Hi!
> > > > > 
> > > > > > +++ b/drivers/leds/leds-lm36274.c
> > > > > 
> > > > > > +static int lm36274_parse_dt(struct lm36274 *lm36274_data)
> > > > > > +{
> > > > > > +	struct fwnode_handle *child = NULL;
> > > > > > +	char label[LED_MAX_NAME_SIZE];
> > > > > > +	struct device *dev = &lm36274_data->pdev->dev;
> > > > > > +	const char *name;
> > > > > > +	int child_cnt;
> > > > > > +	int ret = -EINVAL;
> > > > > > +
> > > > > > +	/* There should only be 1 node */
> > > > > > +	child_cnt = device_get_child_node_count(dev);
> > > > > > +	if (child_cnt != 1)
> > > > > > +		return ret;
> > > > > 
> > > > > I'd do explicit "return -EINVAL" here.
> > > > > 
> > > > 
> > > > ACK
> > > > 
> > > > > > +static int lm36274_probe(struct platform_device *pdev)
> > > > > > +{
> > > > > > +	struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
> > > > > > +	struct lm36274 *lm36274_data;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	lm36274_data = devm_kzalloc(&pdev->dev, sizeof(*lm36274_data),
> > > > > > +				    GFP_KERNEL);
> > > > > > +	if (!lm36274_data) {
> > > > > > +		ret = -ENOMEM;
> > > > > > +		return ret;
> > > > > > +	}
> > > > > 
> > > > > And certainly do "return -ENOMEM" explicitly here.
> > > > > 
> > > > 
> > > > ACK
> > > > 
> > > > > Acked-by: Pavel Machek <pavel@ucw.cz>
> > > 
> > > I've done all amendments requested by Pavel and updated branch
> > > ib-leds-mfd-regulator on linux-leds.git, but in the same time
> > 
> > What do you mean by updated?  You cannot update an 'ib' (immutable
> > branch).  Immutable means that it cannot change, by definition.
> 
> We have already talked about that. Nobody has pulled so the branch
> could have been safely updated.

You have no sure way to know that.  And since I have no way to know,
or faith that you won't update it again, pulling it now/at all would
seem like a foolish thing to do.

Until you can provide me with an assurance that you will not keep
updating/changing the supposedly immutable pull-requests you send out,
I won't be pulling any more in.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
