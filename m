Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82DA92DEFF
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2019 15:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbfE2N6Z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 May 2019 09:58:25 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37492 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbfE2N6Z (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 May 2019 09:58:25 -0400
Received: by mail-wm1-f65.google.com with SMTP id 7so1692810wmo.2
        for <linux-leds@vger.kernel.org>; Wed, 29 May 2019 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=qk0HGBnrffxH0SszLcEFWuIbH/VkDg7vULoFZ+xx0Kc=;
        b=QdxMexFkAlzFN+PfB1ElJBUUAAqH94q9YgBqRg3iwX2qMor9To0i2ro6IzOHJ5q0bR
         lVQCV4jJJbW2ayh/SGGzAb8zFE8i8fS0Ta/sBgsfayq+7MS8EWeflIjpIGPpCd88J3Lr
         gi74EMKfustUw7SYsrSrlzOB3uXKKlobtbDHfkHpwkuEF7P5NLmj/C18ll4IfqvQrSeU
         5L5O0kvAkgy3IyumQGsb/iCDlL3QgdKoNsuQUgvxSDq/1l+O1LglTe2H/nXRudsjk0JU
         uzBIVVqMRZPR6DxOkGvrJFejCrvJgRMgvPdgQrzGLZLh4gVXQVCxUaklGk1sqZSzHbV1
         gluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=qk0HGBnrffxH0SszLcEFWuIbH/VkDg7vULoFZ+xx0Kc=;
        b=oypxXvxbzYigETVFQr565gM0Bs+u0RAZHN1G2c25/GZWcEo+Uhtkr9kbcglRoytxHT
         u0nKW7pIFOoJEX1J5UYPoQq0Svt4W9HNX4Q9xStQ6JezvXeD+WqsAu5/uZsgNznMoBOa
         R1WWa/NcKDHZW8vNDMoSegvxIzO3L0VQFrJdhFeHKHgFR836g452xyP+8q653ezqSRlv
         TV99czsYrmDLbuDbtTsJ6wTyDcVgwojhPiyfesvKeeE9qOl4qhcK8i5qjvmAOxBIpG5l
         n9bAzOSklHxJLYCav7F7C9j8NBbZ0U9cPFIiqE/ywKFHTDOVoBOwa2qF3NNLLCnRDjh3
         pT+Q==
X-Gm-Message-State: APjAAAWYz+Oq13PzL+WY+D1PKFjqX+4yh98BMdZUhwO/0LRgIC6lSNTX
        erNK8c99Omu3yUnWW2tP2ykJCA==
X-Google-Smtp-Source: APXvYqze12mMzt5a2klvAWdo6ZVb9KQXiqj6wF4yVUfnsNbjdM8VvzW17UUMXRJjnqARdqK9wvKZcw==
X-Received: by 2002:a7b:ce9a:: with SMTP id q26mr2105006wmj.11.1559138303516;
        Wed, 29 May 2019 06:58:23 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id d11sm17124712wrv.72.2019.05.29.06.58.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 May 2019 06:58:22 -0700 (PDT)
Date:   Wed, 29 May 2019 14:58:21 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        broonie@kernel.org, lgirdwood@gmail.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274
 LED driver
Message-ID: <20190529135821.GK4574@dell>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-7-dmurphy@ti.com>
 <20190523125012.GB20354@amd>
 <0c2bd6af-92c5-2458-dc41-1ea413545347@ti.com>
 <89a80aa8-66ee-d0ec-fa54-c55ca8de06af@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89a80aa8-66ee-d0ec-fa54-c55ca8de06af@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 24 May 2019, Jacek Anaszewski wrote:

> Hi,
> 
> On 5/23/19 9:09 PM, Dan Murphy wrote:
> > Pavel
> > 
> > Thanks for the review
> > 
> > On 5/23/19 7:50 AM, Pavel Machek wrote:
> > > Hi!
> > > 
> > > > +++ b/drivers/leds/leds-lm36274.c
> > > 
> > > > +static int lm36274_parse_dt(struct lm36274 *lm36274_data)
> > > > +{
> > > > +	struct fwnode_handle *child = NULL;
> > > > +	char label[LED_MAX_NAME_SIZE];
> > > > +	struct device *dev = &lm36274_data->pdev->dev;
> > > > +	const char *name;
> > > > +	int child_cnt;
> > > > +	int ret = -EINVAL;
> > > > +
> > > > +	/* There should only be 1 node */
> > > > +	child_cnt = device_get_child_node_count(dev);
> > > > +	if (child_cnt != 1)
> > > > +		return ret;
> > > 
> > > I'd do explicit "return -EINVAL" here.
> > > 
> > 
> > ACK
> > 
> > > > +static int lm36274_probe(struct platform_device *pdev)
> > > > +{
> > > > +	struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
> > > > +	struct lm36274 *lm36274_data;
> > > > +	int ret;
> > > > +
> > > > +	lm36274_data = devm_kzalloc(&pdev->dev, sizeof(*lm36274_data),
> > > > +				    GFP_KERNEL);
> > > > +	if (!lm36274_data) {
> > > > +		ret = -ENOMEM;
> > > > +		return ret;
> > > > +	}
> > > 
> > > And certainly do "return -ENOMEM" explicitly here.
> > > 
> > 
> > ACK
> > 
> > > Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> I've done all amendments requested by Pavel and updated branch
> ib-leds-mfd-regulator on linux-leds.git, but in the same time

What do you mean by updated?  You cannot update an 'ib' (immutable
branch).  Immutable means that it cannot change, by definition.

> dropped the merge from the for-next.
> 
> We will proceed further once we clarify the issue of cross-merging
> recently raised again by Linus.
> 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
