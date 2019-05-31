Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6099230874
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2019 08:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfEaGXR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 31 May 2019 02:23:17 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38842 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbfEaGXR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 31 May 2019 02:23:17 -0400
Received: by mail-wr1-f68.google.com with SMTP id d18so5647300wrs.5
        for <linux-leds@vger.kernel.org>; Thu, 30 May 2019 23:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=JOe5O0Vecb4WZrLlCJZ3NRQ0mkrLKT1ic7xGlFNydTs=;
        b=x8r5QqpTseoDME1VgGT0+yPcAsP7OhJwpGGxoUu3jDPNibRThZhErvy/v6KMDkaNzf
         LuZWdD0AvxdpfGOyd2k29Vu5n85/sfhE5U5WFhKYsRHFsYharYWbPQOO4NMM7hfoHipd
         AurhWKbykRgf11BPjycWPzPMSYc2gAZa2/YVKqMKDDq3kE6Jf1K58IKZOvD7scyexsaW
         p3IasPoNODH9QSfdpWR865SMt6tb1iu+JshPHH+hhom8cVsgaGEFqU8U7l+DHCniy+66
         9gspXwps7KLg94CzOPWYmq2Uc2fLbrbJo4+o1o3h4A0U/OKC2n3a3k5a04rvE91N4a6L
         oiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=JOe5O0Vecb4WZrLlCJZ3NRQ0mkrLKT1ic7xGlFNydTs=;
        b=e9gXs2N3tL88AI1errlWrxo4AyF8J5OU4of+gcLuUBhl+68YE4nJ+MnOwdqtdQKMTh
         hLxnaXEsL7xXpjOeI2NZgSHEogvSVNFOFJ+JFlX+0lDzTkParGh8x2+R6YBwJcnapjPA
         5NkywWgnnXyCC/7ZLwg9bkMHKBVI8oTuP5yl6eobuneZrVn5rIHmx1Egid/z6hYwLCOH
         DdRXZeIY9tt/9U/NlEtTwDhmpVnwFdJVPW3+ZIpGf8VptM6QevvP5aHvZMM2cOyDMLEu
         Xb7wsRp0B4utT1x8SqHMSxZuHV1MWrnur160OGi8/X7Rf912ta3Ci9I2wbMI+r4udDRD
         MqJg==
X-Gm-Message-State: APjAAAXSQ8txrdCGG5CI1wU1jzGznopQsUC0JUGvJA9lw0cZ+aL/hquc
        sz3SHzWiaSE+hvRBDl6AyiW51g==
X-Google-Smtp-Source: APXvYqzuoPZpb0HguN0mvv5bqUYYFkW0BfMUh4ZKVwr0Ty8/Lmt4HY6xBt0kTpyccPrg4gCL9Oghiw==
X-Received: by 2002:adf:f046:: with SMTP id t6mr5455013wro.307.1559283795026;
        Thu, 30 May 2019 23:23:15 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id p3sm1455210wrd.47.2019.05.30.23.23.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2019 23:23:14 -0700 (PDT)
Date:   Fri, 31 May 2019 07:23:12 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        broonie@kernel.org, lgirdwood@gmail.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274
 LED driver
Message-ID: <20190531062312.GP4574@dell>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-7-dmurphy@ti.com>
 <20190523125012.GB20354@amd>
 <0c2bd6af-92c5-2458-dc41-1ea413545347@ti.com>
 <89a80aa8-66ee-d0ec-fa54-c55ca8de06af@gmail.com>
 <20190529135821.GK4574@dell>
 <afff7c24-bb68-e9dc-295e-4449f9729cc9@gmail.com>
 <20190530073827.GL4574@dell>
 <c75025f5-a984-78fa-2737-d10027e5741c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c75025f5-a984-78fa-2737-d10027e5741c@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 30 May 2019, Jacek Anaszewski wrote:

> On 5/30/19 9:38 AM, Lee Jones wrote:
> > On Wed, 29 May 2019, Jacek Anaszewski wrote:
> > 
> > > On 5/29/19 3:58 PM, Lee Jones wrote:
> > > > On Fri, 24 May 2019, Jacek Anaszewski wrote:
> > > > 
> > > > > Hi,
> > > > > 
> > > > > On 5/23/19 9:09 PM, Dan Murphy wrote:
> > > > > > Pavel
> > > > > > 
> > > > > > Thanks for the review
> > > > > > 
> > > > > > On 5/23/19 7:50 AM, Pavel Machek wrote:
> > > > > > > Hi!
> > > > > > > 
> > > > > > > > +++ b/drivers/leds/leds-lm36274.c
> > > > > > > 
> > > > > > > > +static int lm36274_parse_dt(struct lm36274 *lm36274_data)
> > > > > > > > +{
> > > > > > > > +	struct fwnode_handle *child = NULL;
> > > > > > > > +	char label[LED_MAX_NAME_SIZE];
> > > > > > > > +	struct device *dev = &lm36274_data->pdev->dev;
> > > > > > > > +	const char *name;
> > > > > > > > +	int child_cnt;
> > > > > > > > +	int ret = -EINVAL;
> > > > > > > > +
> > > > > > > > +	/* There should only be 1 node */
> > > > > > > > +	child_cnt = device_get_child_node_count(dev);
> > > > > > > > +	if (child_cnt != 1)
> > > > > > > > +		return ret;
> > > > > > > 
> > > > > > > I'd do explicit "return -EINVAL" here.
> > > > > > > 
> > > > > > 
> > > > > > ACK
> > > > > > 
> > > > > > > > +static int lm36274_probe(struct platform_device *pdev)
> > > > > > > > +{
> > > > > > > > +	struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
> > > > > > > > +	struct lm36274 *lm36274_data;
> > > > > > > > +	int ret;
> > > > > > > > +
> > > > > > > > +	lm36274_data = devm_kzalloc(&pdev->dev, sizeof(*lm36274_data),
> > > > > > > > +				    GFP_KERNEL);
> > > > > > > > +	if (!lm36274_data) {
> > > > > > > > +		ret = -ENOMEM;
> > > > > > > > +		return ret;
> > > > > > > > +	}
> > > > > > > 
> > > > > > > And certainly do "return -ENOMEM" explicitly here.
> > > > > > > 
> > > > > > 
> > > > > > ACK
> > > > > > 
> > > > > > > Acked-by: Pavel Machek <pavel@ucw.cz>
> > > > > 
> > > > > I've done all amendments requested by Pavel and updated branch
> > > > > ib-leds-mfd-regulator on linux-leds.git, but in the same time
> > > > 
> > > > What do you mean by updated?  You cannot update an 'ib' (immutable
> > > > branch).  Immutable means that it cannot change, by definition.
> > > 
> > > We have already talked about that. Nobody has pulled so the branch
> > > could have been safely updated.
> > 
> > You have no sure way to know that.  And since I have no way to know,
> > or faith that you won't update it again, pulling it now/at all would
> > seem like a foolish thing to do.
> 
> Sorry, but you are simply unjust. You're pretending to portray the
> situation as if I have been notoriously causing merge conflicts in
> linux-next which did not take place.
> 
> Just to recap what this discussion is about:
> 
> On 7 Apr 2019:
> 
> 1. I sent pull request [0].
> 2. 45 minutes later I updated it after discovering one omission [1].
>    It was rather small chance for it to be pulled as quickly as that.
>    And even if it happened it wouldn't have been much harmful - we
>    wouldn't have lost e.g. weeks of testing in linux-next due to that
>    fact.
> 
> On 21 May 2019:
> 
> 3. I sent another pull request [2] to you and REGULATOR maintainers.
>    After it turned out that lack of feedback from REGULATOR maintainers
>    was caused by failing to send them the exact copies of patches to
>    review, I informed you about possible need for updating the branch.
>    Afterwards I received a reply from you saying that you hadn't pulled
>    the branch anyway. At that point I was sure that neither MFD nor
>    REGULATOR tree contains the patches. And only after that I updated
>    the branch.

Here are 2 examples where you have changed immutable branches, which
is 100% of the Pull Requests I have received from you.  Using that
record as a benchmark, the situation hardly seems unjust.

> > Until you can provide me with an assurance that you will not keep
> > updating/changing the supposedly immutable pull-requests you send out,
> > I won't be pulling any more in.
> 
> I can just uphold the assurance which is implicitly assumed for anyone
> who has never broken acclaimed rules. As justified above.

You have broken the rules every (100% of the) time.

> [0] https://lore.kernel.org/patchwork/patch/1059075/
> [1] https://lore.kernel.org/patchwork/patch/1059080/
> [2] https://lore.kernel.org/patchwork/patch/1077066/

So we have 2 choices moving forward; you can either provide me with
assurance that you have learned from this experience and will never
change an *immutable* branch again, or I can continue to handle them,
which has been the preference for some years.

If you choose the former and adaptions need to be made in the future,
the correct thing to do is create a *new*, different pull-request
which has its own *new*, different tag, but uses the original tag as a
base.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
