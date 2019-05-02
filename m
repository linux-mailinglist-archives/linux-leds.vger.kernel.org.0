Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA69110D7
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2019 03:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfEBBLR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 May 2019 21:11:17 -0400
Received: from mail.nic.cz ([217.31.204.67]:42508 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbfEBBLR (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 1 May 2019 21:11:17 -0400
Received: from localhost (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTPS id 68AB86320A;
        Thu,  2 May 2019 03:11:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556759475; bh=nDw/S4rBUsC8H2iRUNYTUL/3OmYuK4aPdWaYMPZUfgU=;
        h=Date:From:To;
        b=sw3tIuW0Q86PpSEsII/FoCnYcUhcmY9VuhwUXXMZ2Q7Y8gXNF1jX9dKZoW8iNK5zG
         YRUWnjjgG1Oa6UlJZco+EReUL4CG3MRP/C/YirUjlGhDbf4gEDYUXFkuOi6S8LU9X5
         ztwLfYPRWvymoVRoI13JjpCvDLdI9nw5hWW53Ens=
Date:   Thu, 2 May 2019 03:11:15 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH leds-next RFC 1/1] led: triggers: add HW LED triggers
 functionality
Message-ID: <20190502031115.0620770e@nic.cz>
In-Reply-To: <20190502005447.11919-1-marek.behun@nic.cz>
References: <20190502005447.11919-1-marek.behun@nic.cz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> @@ -49,6 +54,29 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>  		goto unlock;
>  	}
>  
> +#ifdef CONFIG_LEDS_HW_TRIGGERS
> +	/* check if a hardware LED trigger was selected */
> +	if (!strncmp(buf, "hw:", 3)) {
> +		const char * const *hwtrig;
> +
> +		if (!led_cdev->hw_triggers) {

this should be led_cdev->available_hw_triggers


> @@ -95,6 +135,20 @@ ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
>  					 trig->name);
>  	}
>  	up_read(&led_cdev->trigger_lock);
> +
> +#ifdef CONFIG_LEDS_HW_TRIGGERS

> +	for (hwtrig = led_cdev->available_hw_triggers;
> +	     *hwtrig; ++hwtrig) {

             hwtrig && *hwtrig
