Return-Path: <linux-leds+bounces-4838-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C0ADDAB7
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 19:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D825188BED4
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 17:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED472DBF45;
	Tue, 17 Jun 2025 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mc6fMNVw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A21285079;
	Tue, 17 Jun 2025 17:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750181411; cv=none; b=M3ab12ykDaUTdXGZSl2Vvq0DYg+VzgrPtXhlBuvO7LWlfIcDzaGVSpEEr6w9I+lcQNkFi98HrCE1IxIkGQHDO3VezK5DSbc5QL6J1e5DerJL+DO32dZfoUKoDj3LVN5UTnvTLwq7sGms7cXVkTc4qaUEFpjDT5qzroWuwq+nXL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750181411; c=relaxed/simple;
	bh=IGsmcuwJXjEnfGubxZ1RKl4+HzWgxpXUtAwOzTFRY3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UufTX3qONshQpMXGctEFZdo92xE8vseZyMQXk5tPKLCGFFedX0Q0b7wWqP0NWiAWsvfk0gPTpfE1S8jjNX5XxkxSKqiL1cd0j9e7/u12/Oj5sOCJmJp/g107yrzpzNjRsAgKhQG4/togmrm3QdBvbuUWR7ZJzpM4HQXOZrN4g9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mc6fMNVw; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2c4476d381so5027198a12.0;
        Tue, 17 Jun 2025 10:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750181409; x=1750786209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhk8jGOaZDAa5EqoSmpTbXR4Ag85GcTozQgz77RVrTk=;
        b=Mc6fMNVw4psH0BJj9Dx3O2/4OH8R+ufmf8k20sZ0xKvMiIsa63nMyw4XNNA52eB3xx
         1tIQyvRwhm88OMApEeMYAsXpZW2Og0i+qThOnkHYNsgXOpKRqEMs6UVq46wCe++71XCx
         xhvn+u+NV9V3Ky9UQOBm4EaWIdvNlAIprS5Y2531x7Z9+I8sl0I1M9NookINyME43bpg
         wMyc+824Lslj5YgUoufrzMWnbS2Or4UUvn7CgeCG4Jwc2tvSLBeaNCR30sO8v+T7PP+d
         YvIfCJm6V8dgmT5t1xjsmkfpGFVaoepUO5CfRwsMFPhYycTrOG6TYgWd7RPfZi2uVr7e
         4V3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750181409; x=1750786209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhk8jGOaZDAa5EqoSmpTbXR4Ag85GcTozQgz77RVrTk=;
        b=MDZNae7wpEho9WvnCr7AF1SS/kIe5IwbKBaSuya6Eh26bKCpg9220wOM7UUBKEnOwL
         ysplYbD3YrDu895S2059YyuJUnSoT/nI9SntjtOo+CDu6dXf19EZaY9zliZ/gvnwJjh7
         lqZR7qxabaIMrmKNo37RdZcZBJVUdPvXn/7zCFMUcVAeg68GZwxaWeYY3Y/Aj3olbrFj
         of0h3RDxLHJLFe1Zpi4kDg+06PkeDd97S8uHf31XENgdMXiSeZxSabS0bRtMFlqGDHmh
         U2O75/MQlzwBinIV963u0U9/Ufa6eB2nj26kmsMIqf39Qwf036qh4d2weIbGFZ6qvJAQ
         3HMg==
X-Forwarded-Encrypted: i=1; AJvYcCUCEr2v5dfubSawnJtLVYgvnI8XM2YzpGA/IsVkqSpHE2vI8EKt7s0JssvaRLofcBCZN6D1KO2RW1DjmszM@vger.kernel.org, AJvYcCUMcG3dl3mR++0FTqQOdwgNVP/gosK9JrUxwuMZgu3Yj7r0qC3xt0m8tbxE87sV14IrntVyOZOFMAgQug==@vger.kernel.org, AJvYcCUVN7g7KEUARBWx6ixcy4/BII/6AqPPBjCkY2BSx6mob+pzZfzVFfWpNhBCVICawNQbaaWjca09t/Ll@vger.kernel.org, AJvYcCVcvzmAxwwr73rEuX5WEODpmj8Ca0oOcu3cYAD/bu8W1Xf55m2+45S8uogkIrrFMsF4+ecnHdTpfoOS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Vjrw8eDp9j0923AaX/4vggxfFnys4mi9cS5U2Jjg0Pdfv0Nw
	VhSVocyVxkRvgq0bwCXAyLwvqNZC8lXJ7cb1TajjtdiHd1O03Wx7n/cQ
X-Gm-Gg: ASbGncvrXd4usIiurVdqt2aIuKCo2552Mq8HnHQZcweNxgunNxmbpwv4W5AMI+7KfAt
	qFeLk+iqf/jTRTL1ZlnuZ5ro6cURxm3jTl/RI8nhYaTAhXX7Q5V5IwHXwwa84RL4gt/n9ZcSTzw
	18h2p/4uS5F2j4UDntR4FvMF0mX5J6ED9QXJ8isacmB4AGNmIROjUxB+/8TleiNOx+wwgR0pjZ6
	t37USgpVtKnp9c32yr6iFROs6PB101TFRAgSLyhN3SLzdhWORQohQdztKH40DdvQlMZOwhQ2xMQ
	9tTeQW6B3Xu2L2254+9hadAiMDbJRFzUPLrwYWCPwVwqzVAagj6eZlL4hXU7YOS4l9lIEaG82OG
	ZMwwWI4k=
X-Google-Smtp-Source: AGHT+IFLuD8HTG8FAQ2HO+cOiu9Tara6TS9wXId7+ckrwN5AmK8tAnFnQoZlxup6NCubrca7a8vZhg==
X-Received: by 2002:a05:6a21:6f8b:b0:21c:fa68:9da6 with SMTP id adf61e73a8af0-21fbc6c773fmr22731462637.8.1750181408701;
        Tue, 17 Jun 2025 10:30:08 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748e1a26105sm440535b3a.45.2025.06.17.10.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 10:30:08 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: christophe.jaillet@wanadoo.fr
Cc: lee@kernel.org,
	pavel@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 2/4] leds: add TI/National Semiconductor LP5812 LED Driver
Date: Wed, 18 Jun 2025 00:30:03 +0700
Message-Id: <20250617173003.28933-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <42676fe3-8758-42ea-8e21-9c3955468c78@wanadoo.fr>
References: <42676fe3-8758-42ea-8e21-9c3955468c78@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 10 Jun 2025, Christophe JAILLET wrote:

> > +static struct lp5812_data *lp5812_of_populate_pdata(struct device *dev,
> > +						    struct device_node *np,
> > +						    struct lp5812_chip *chip)
> > +{
> > +	struct device_node *child;
> > +	struct lp5812_data *pdata;
> > +	struct lp5812_led_config *cfg;
> > +	int num_channels, i = 0, ret;
> > +
> > +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> > +	if (!pdata)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	num_channels = of_get_available_child_count(np);
> > +	if (num_channels == 0) {
> > +		dev_err(dev, "no LED channels\n");
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	cfg = devm_kcalloc(dev, num_channels, sizeof(*cfg), GFP_KERNEL);
> > +	if (!cfg)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	pdata->led_config = &cfg[0];
> > +	pdata->num_channels = num_channels;
> > +
> > +	for_each_available_child_of_node(np, child) {
> 
> Maybe for_each_available_child_of_node_scoped() to slihtly simplify the 
> code?

Thanks, I'll switch to for_each_available_child_of_node_scoped().

> > +static ssize_t lp5812_aeu_slope_time(struct device *dev,
> > +				     struct device_attribute *attr,
> > +				     enum slope_time_num slope_chan,
> > +				     const char *buf, size_t len)
> > +{
> > +	struct lp5812_led *led;
> > +	struct lp5812_chip *chip;
> > +	struct lp5812_led_config *led_cfg;
> > +	const char *name = dev->platform_data;
> > +	int val[LED_COLOR_ID_MAX];
> > +	u8 chan_nr = 0;
> > +	char *sub_str, *str = (char *)buf;
> > +	int i, ret, aeu;
> > +	union slope_time slope_time_val;
> > +	u16 reg;
> > +
> > +	if (strcmp(name, LP5812_SC_LED) == 0)
> > +		led = dev_to_lp5812_led(dev);
> > +	else
> > +		led = dev_to_lp5812_led_mc(dev);
> > +
> > +	chan_nr = led->chan_nr;
> > +	chip = led->chip;
> > +	led_cfg = &chip->pdata->led_config[chan_nr];
> > +
> > +	sub_str = strsep(&str, ":");
> > +	if (!sub_str)
> > +		return -EINVAL;
> > +	if (kstrtoint(&sub_str[3], 0, &aeu))
> > +		return -EINVAL;
> > +
> > +	pr_info("AEU = %d", aeu);
> > +
> > +	guard(mutex)(&chip->lock);
> > +	for (i = 0; i < led_cfg->num_colors; i++) {
> > +		sub_str = strsep(&str, " ");
> > +		if (!sub_str)
> > +			return -EINVAL;
> > +		if (kstrtoint(sub_str, 0, &val[i]))
> > +			return -EINVAL;
> > +		if (val[i] < 0 || val[i] > 15)
> > +			return -EINVAL;
> > +
> > +		reg = LP5812_AEU_SLOPE_TIME_ADDR(led_cfg->led_id[i], aeu, slope_chan);
> > +
> > +		/* get original value of slope time */
> > +		ret = lp5812_read(chip, reg, &slope_time_val.time_val);
> > +		if (ret)
> > +			return ret;
> > +
> > +		/* Update new value for slope time*/
> > +		if (slope_chan == LP5812_SLOPE_TIME_T1 || slope_chan == LP5812_SLOPE_TIME_T3)
> > +			slope_time_val.s_time.first = val[i];
> > +		if (slope_chan == LP5812_SLOPE_TIME_T2 || slope_chan == LP5812_SLOPE_TIME_T4)
> > +			slope_time_val.s_time.second = val[i];
> > +
> > +		/* Save updated value to hardware */
> > +		ret = lp5812_write(chip, reg, slope_time_val.time_val);
> 
> Should we do something if ret != 0?

Yes. I'll add a return check to handle possible write errors.

> > +static struct attribute *lp5812_led_attrs[] = {
> > +	&dev_attr_led_current.attr,
> > +	&dev_attr_max_current.attr,
> > +	&dev_attr_mode.attr,
> > +	&dev_attr_activate.attr,
> > +	&dev_attr_pwm_dimming_scale.attr,
> > +	&dev_attr_pwm_phase_align.attr,
> > +	&dev_attr_auto_time_pause_at_start.attr,
> > +	&dev_attr_auto_time_pause_at_stop.attr,
> > +	&dev_attr_auto_playback_eau_number.attr,
> > +	&dev_attr_auto_playback_time.attr,
> > +	&dev_attr_aeu_playback_time.attr,
> > +	&dev_attr_aeu_pwm1.attr,
> > +	&dev_attr_aeu_pwm2.attr,
> > +	&dev_attr_aeu_pwm3.attr,
> > +	&dev_attr_aeu_pwm4.attr,
> > +	&dev_attr_aeu_pwm5.attr,
> > +	&dev_attr_aeu_slop_time_t1.attr,
> > +	&dev_attr_aeu_slop_time_t2.attr,
> > +	&dev_attr_aeu_slop_time_t3.attr,
> > +	&dev_attr_aeu_slop_time_t4.attr,
> > +	&dev_attr_lod_lsd.attr,
> > +	NULL,
> 
> Unneeded trailing comma after a terminator.

I'll remove it.

> > +static int lp5812_init_led(struct lp5812_led *led, struct lp5812_chip *chip, int chan)
> > +{
> > +	struct lp5812_data *pdata = chip->pdata;
> > +	struct device *dev = &chip->i2c_cl->dev;
> > +	struct mc_subled *mc_led_info;
> > +	struct led_classdev *led_cdev;
> > +	char name[32];
> > +	int i, ret = 0;
> > +
> > +	if (pdata->led_config[chan].name) {
> > +		led->cdev.name = pdata->led_config[chan].name;
> > +	} else {
> > +		snprintf(name, sizeof(name), "%s:channel%d",
> > +			 pdata->label ? : chip->i2c_cl->name, chan);
> > +		led->cdev.name = name;
> 
> Is it fine below when 'name' is defined on the stack and is used...
> 
> > +	}
> > +
> > +	if (pdata->led_config[chan].is_sc_led == 0) {
> > +		mc_led_info = devm_kcalloc(dev,
> > +					   pdata->led_config[chan].num_colors,
> > +					   sizeof(*mc_led_info), GFP_KERNEL);
> > +		if (!mc_led_info)
> > +			return -ENOMEM;
> > +
> > +		led_cdev = &led->mc_cdev.led_cdev;
> > +		led_cdev->name = led->cdev.name;
> 
> ...here?

You're right, name was stack-allocated and unsafe to use after the function returns.
I'll replace it with a devm_kasprintf() allocation.

Appreciate your time and feedback.

Best regards,
Nam Tran

