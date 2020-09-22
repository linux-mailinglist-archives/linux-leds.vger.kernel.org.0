Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4E02745DF
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 17:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgIVP7A convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Tue, 22 Sep 2020 11:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgIVP67 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 11:58:59 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1EF3C061755
        for <linux-leds@vger.kernel.org>; Tue, 22 Sep 2020 08:58:59 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 01B5314094B;
        Tue, 22 Sep 2020 17:58:57 +0200 (CEST)
Date:   Tue, 22 Sep 2020 17:58:56 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH leds v3 2/9] leds: lm36274: don't iterate through
 children since there is only one
Message-ID: <20200922175856.7efeb161@nic.cz>
In-Reply-To: <a2db44c8-9153-3b0e-b3fe-cb96821116ab@ti.com>
References: <20200919180304.2885-1-marek.behun@nic.cz>
        <20200919180304.2885-3-marek.behun@nic.cz>
        <a2db44c8-9153-3b0e-b3fe-cb96821116ab@ti.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 22 Sep 2020 10:42:49 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Hello
> 
> On 9/19/20 1:02 PM, Marek Behún wrote:
> > Do not use device_for_each_child_node. Since this driver works only with
> > once child node present, use device_get_next_child_node instead.
> > This also saves one level of indentation.
> >
> > Signed-off-by: Marek Behún <marek.behun@nic.cz>
> > Cc: Dan Murphy <dmurphy@ti.com>
> > ---
> >   drivers/leds/leds-lm36274.c | 50 +++++++++++++++++--------------------
> >   1 file changed, 23 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
> > index 4a9f786bb9727..e0fce74a76675 100644
> > --- a/drivers/leds/leds-lm36274.c
> > +++ b/drivers/leds/leds-lm36274.c
> > @@ -72,40 +72,36 @@ static int lm36274_parse_dt(struct lm36274 *chip)
> >   	char label[LED_MAX_NAME_SIZE];
> >   	struct device *dev = &chip->pdev->dev;
> >   	const char *name;
> > -	int child_cnt;
> > -	int ret = -EINVAL;
> > +	int ret;
> >   
> >   	/* There should only be 1 node */
> > -	child_cnt = device_get_child_node_count(dev);
> > -	if (child_cnt != 1)
> > +	if (device_get_child_node_count(dev) != 1)
> >   		return -EINVAL;
> >   
> > -	device_for_each_child_node(dev, child) {
> > -		ret = fwnode_property_read_string(child, "label", &name);
> > -		if (ret)
> > -			snprintf(label, sizeof(label), "%s::",
> > -				 chip->pdev->name);
> > -		else
> > -			snprintf(label, sizeof(label), "%s:%s",
> > -				 chip->pdev->name, name);
> > -
> > -		chip->num_leds = fwnode_property_count_u32(child, "led-sources");
> > -		if (chip->num_leds <= 0)
> > -			return -ENODEV;
> > -
> > -		ret = fwnode_property_read_u32_array(child, "led-sources",
> > -						     chip->led_sources,
> > -						     chip->num_leds);
> > -		if (ret) {
> > -			dev_err(dev, "led-sources property missing\n");
> > -			return ret;
> > -		}
> > -
> > -		fwnode_property_read_string(child, "linux,default-trigger",
> > -					    &chip->led_dev.default_trigger);
> > +	child = device_get_next_child_node(dev, NULL);
> > +
> > +	ret = fwnode_property_read_string(child, "label", &name);
> > +	if (ret)
> > +		snprintf(label, sizeof(label), "%s::", chip->pdev->name);
> > +	else
> > +		snprintf(label, sizeof(label), "%s:%s", chip->pdev->name, name);
> >   
> > +	chip->num_leds = fwnode_property_count_u32(child, "led-sources");
> > +	if (chip->num_leds <= 0)
> > +		return -ENODEV;
> > +
> > +	ret = fwnode_property_read_u32_array(child, "led-sources",
> > +					     chip->led_sources, chip->num_leds);
> > +	if (ret) {
> > +		dev_err(dev, "led-sources property missing\n");
> > +		return ret;
> >   	}
> >   
> > +	fwnode_property_read_string(child, "linux,default-trigger",
> > +				    &chip->led_dev.default_trigger);
> > +
> > +	fwnode_handle_put(child);
> > +
> >   	chip->lmu_data.regmap = chip->regmap;
> >   	chip->lmu_data.max_brightness = MAX_BRIGHTNESS_11BIT;
> >   	chip->lmu_data.msb_brightness_reg = LM36274_REG_BRT_MSB;  
> 
> Question is this device on a piece of hardware you are testing on?

No, unfortunately. But this driver is rather simple, in comparison to
the others.

As Linus said:
  "If it compiles, it is good; if it boots up, it is perfect."
:D

So if someone tested it, it would be perfect.

Marek

> Just wondering how you functionally tested all these changes you submitted
> 
> Reviewed-by: Dan Murphy <dmurphy@ti.com>
> 

