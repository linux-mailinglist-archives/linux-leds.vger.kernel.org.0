Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846851FAEB2
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2020 12:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgFPKyk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Jun 2020 06:54:40 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53754 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgFPKyj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 Jun 2020 06:54:39 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A00DE1C0BD2; Tue, 16 Jun 2020 12:54:38 +0200 (CEST)
Date:   Tue, 16 Jun 2020 12:54:29 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v27 03/15] leds: multicolor: Introduce a multicolor class
 definition
Message-ID: <20200616105429.GI1718@bug>
References: <20200608193917.13084-1-dmurphy@ti.com>
 <20200608193917.13084-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608193917.13084-4-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> +static ssize_t multi_intensity_show(struct device *dev,
> +			      struct device_attribute *intensity_attr,
> +			      char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
> +	int len = 0;
> +	int i;
> +
> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
> +		len += sprintf(buf + len, "%d",
> +			       mcled_cdev->subled_info[i].intensity);
> +		if (i < mcled_cdev->num_colors)
> +			len += sprintf(buf + len, " ");

Always false, AFAICT.

									Pavel
