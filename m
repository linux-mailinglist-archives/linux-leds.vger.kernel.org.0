Return-Path: <linux-leds+bounces-1912-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB2D9078C4
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 18:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57E931F22592
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8D514A0B6;
	Thu, 13 Jun 2024 16:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2QAGupl"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4523614A089;
	Thu, 13 Jun 2024 16:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718297533; cv=none; b=Q6nLweDxLCwtjfFM+oI3iJXMHXJrqphVQAvoHCdrJDgcQKe761BEF4DArch6rQzT1OTuvD4BvjyuqwSNal6Wn/zb92EvuCYhN3xFahTm1tQGXfoa7seAOk9mO11LTU1ssirwjL0gnXfyVPN2Zau31Jr/VzlNLggTg7NtNDZ2BDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718297533; c=relaxed/simple;
	bh=rlRbPe4JiRVKNfQqrwB6rVn5Hp9NsRn1cTMMfWFUBXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcaj34hkQV3e6NSvUTZSzcTWvbkSEvVMUSFeDpjAZFCIoxsrz4Et+Gorf+G3Sc1GzI/FrOySN7C6JeWEVHs/F4HdMJGSW5/p/JpdEi4xup/6hm9SyCYOUsXIP2/7ZuWr2EG6PJjO9HR6ilFamoA6dywf1DwFdAX10kI+lsoRiYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2QAGupl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B39C2BBFC;
	Thu, 13 Jun 2024 16:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718297532;
	bh=rlRbPe4JiRVKNfQqrwB6rVn5Hp9NsRn1cTMMfWFUBXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L2QAGuplBSRhbY+ftBTW5t7gCGUw7I4QB9OxSxutK4i7ikQoI3eDx2MAz4ZTl/qs5
	 edw5FdQyFRksHPhScYhU9P3bMtueaXT/r/Ke7XaxEX+e7bLKaNCpGAt8nemvXKlMrE
	 ArriVujo/jAwhDpQJIhx5EhwWmY5N8eSzXbqqbsPinBQVHHmtjAI0vtsvTWc7KDgRZ
	 3/BdMPf260ko6e1tWhflioKL8GCL/pVf84c3bIPCT4RIdCmieAR/HFj6jBN+3yEiZF
	 ySq+htAb1PKL+vVlQsd8DXS7KOmuomiJUQIWArvzyG6G6l3DvJJHXWts6/kH/ax7KH
	 2bo9imH2IdJCw==
Date: Thu, 13 Jun 2024 17:52:07 +0100
From: Lee Jones <lee@kernel.org>
To: Marilene Andrade Garcia <marilene.agarcia@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 linux-next] leds: powernv: replace of_node_put to
 __free
Message-ID: <20240613165207.GO2561462@google.com>
References: <20240601031713.1307859-1-marilene.agarcia@gmail.com>
 <98a5e808-68b5-42d0-8572-78b724b7078d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98a5e808-68b5-42d0-8572-78b724b7078d@gmail.com>

On Fri, 07 Jun 2024, Marilene Andrade Garcia wrote:

> On 01/06/2024 00:17, MarileneGarcia wrote:
> > Use __free for device_node values, and thus drop calls to
> > of_node_put.
> > 
> > The variable attribute __free adds a scope based cleanup to
> > the device node. The goal is to reduce memory management issues
> > in the kernel code.
> > 
> > The of_node_put calls were removed, and the
> > for_each_available_child_of_node was replaced to the equivalent
> > for_each_available_child_of_node_scoped which use the __free.
> > 
> > Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> > Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
> > ---
> > Hello,
> > Thank you for the feedback.
> > 
> > The line-break strategy was fixed, and now it is according to
> > the top one suggested.
> > 
> > The __free is a wrapper to __attribute__((__cleanup__())) so
> > the variavel definition is needed. And according to Julia, it
> > is preferred to combine the declaration and the allocation to
> > ensure that there is no return that can occur after the declaration,
> > but before the allocation (or more precisely the initialization).
> > If there is no other option for the initialization of the variable,
> > then it should be NULL.
> > 
> >   drivers/leds/leds-powernv.c | 28 +++++++++-------------------
> >   1 file changed, 9 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
> > index 4f01acb75727..49ab8c9a3f29 100644
> > --- a/drivers/leds/leds-powernv.c
> > +++ b/drivers/leds/leds-powernv.c
> > @@ -246,29 +246,25 @@ static int powernv_led_classdev(struct platform_device *pdev,
> >   	const char *cur = NULL;
> >   	int rc = -1;
> >   	struct property *p;
> > -	struct device_node *np;
> >   	struct powernv_led_data *powernv_led;
> >   	struct device *dev = &pdev->dev;
> > -	for_each_available_child_of_node(led_node, np) {
> > +	for_each_available_child_of_node_scoped(led_node, np) {
> >   		p = of_find_property(np, "led-types", NULL);
> >   		while ((cur = of_prop_next_string(p, cur)) != NULL) {
> >   			powernv_led = devm_kzalloc(dev, sizeof(*powernv_led),
> >   						   GFP_KERNEL);
> > -			if (!powernv_led) {
> > -				of_node_put(np);
> > +			if (!powernv_led)
> >   				return -ENOMEM;
> > -			}
> >   			powernv_led->common = powernv_led_common;
> >   			powernv_led->loc_code = (char *)np->name;
> >   			rc = powernv_led_create(dev, powernv_led, cur);
> > -			if (rc) {
> > -				of_node_put(np);
> > +			if (rc)
> >   				return rc;
> > -			}
> > +
> >   		} /* while end */
> >   	}
> > @@ -278,12 +274,11 @@ static int powernv_led_classdev(struct platform_device *pdev,
> >   /* Platform driver probe */
> >   static int powernv_led_probe(struct platform_device *pdev)
> >   {
> > -	struct device_node *led_node;
> >   	struct powernv_led_common *powernv_led_common;
> >   	struct device *dev = &pdev->dev;
> > -	int rc;
> > +	struct device_node *led_node
> > +		__free(device_node) = of_find_node_by_path("/ibm,opal/leds");
> > -	led_node = of_find_node_by_path("/ibm,opal/leds");
> >   	if (!led_node) {
> >   		dev_err(dev, "%s: LED parent device node not found\n",
> >   			__func__);
> > @@ -292,20 +287,15 @@ static int powernv_led_probe(struct platform_device *pdev)
> >   	powernv_led_common = devm_kzalloc(dev, sizeof(*powernv_led_common),
> >   					  GFP_KERNEL);
> > -	if (!powernv_led_common) {
> > -		rc = -ENOMEM;
> > -		goto out;
> > -	}
> > +	if (!powernv_led_common)
> > +		return -ENOMEM;
> >   	mutex_init(&powernv_led_common->lock);
> >   	powernv_led_common->max_led_type = cpu_to_be64(OPAL_SLOT_LED_TYPE_MAX);
> >   	platform_set_drvdata(pdev, powernv_led_common);
> > -	rc = powernv_led_classdev(pdev, led_node, powernv_led_common);
> > -out:
> > -	of_node_put(led_node);
> > -	return rc;
> > +	return powernv_led_classdev(pdev, led_node, powernv_led_common);
> >   }
> >   /* Platform driver remove */
> 
> Hello,
> Did you have a chance to look at the patch after the requested change?

Was that for me?  Please refrain from pinging.

My TODO list is long and I'm doing my best to get through it.

-- 
Lee Jones [李琼斯]

