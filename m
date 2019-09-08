Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F74BACED1
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 15:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727568AbfIHNIi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Sep 2019 09:08:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:55252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbfIHNIi (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 8 Sep 2019 09:08:38 -0400
Received: from localhost (unknown [62.28.240.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CD861218AC;
        Sun,  8 Sep 2019 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567948117;
        bh=X/o95kvSy7OdfcdXySBBcFEXqPa6ZJsG2XuvalElAS8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C1iIAaabgxegbXdi0of7yQr+lOOhtl681WLTrAD33uyrY6JvAQes42Hs4xguu/5JM
         esUNZgrKlAtJbWIWB9KNs6vWr4pfpgWoUP3AjRHi9AR+C/J6dpNLvkw/TtM6MLEdkX
         iIk4sd+m03uHzaj7Mh94B1vbfyAUkDX7bx96R2iw=
Date:   Sun, 8 Sep 2019 14:08:34 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 3/5] driver core: class: add function to create
 /sys/class/<class>/foo directory
Message-ID: <20190908130834.GB9466@kroah.com>
References: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
 <1567946472-10075-4-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567946472-10075-4-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Sep 08, 2019 at 09:41:10PM +0900, Akinobu Mita wrote:
> This adds a new function class_kobject_create_and_add() that creates a
> directory in the /sys/class/<class>.
> 
> This function is required to create the /sys/class/leds/triggers directory
> that contains all available LED triggers.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  drivers/base/class.c   | 7 +++++++
>  include/linux/device.h | 3 +++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/base/class.c b/drivers/base/class.c
> index d8a6a58..f4c53e7 100644
> --- a/drivers/base/class.c
> +++ b/drivers/base/class.c
> @@ -104,6 +104,13 @@ void class_remove_file_ns(struct class *cls, const struct class_attribute *attr,
>  		sysfs_remove_file_ns(&cls->p->subsys.kobj, &attr->attr, ns);
>  }
>  
> +struct kobject *class_kobject_create_and_add(const char *name,
> +					     struct class *cls)
> +{
> +	return kobject_create_and_add(name, &cls->p->subsys.kobj);
> +}
> +EXPORT_SYMBOL_GPL(class_kobject_create_and_add);

Ick, why?  Are you _SURE_ you really need to do this?  Positive?  This
feels very strange...

greg k-h
