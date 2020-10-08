Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52C32870FA
	for <lists+linux-leds@lfdr.de>; Thu,  8 Oct 2020 10:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbgJHIzx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Oct 2020 04:55:53 -0400
Received: from lists.nic.cz ([217.31.204.67]:46940 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgJHIzw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 8 Oct 2020 04:55:52 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 06BD813FFB6;
        Thu,  8 Oct 2020 10:55:51 +0200 (CEST)
Date:   Thu, 8 Oct 2020 10:55:50 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Message-ID: <20201008105550.44fa3165@nic.cz>
In-Reply-To: <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201006165850.17790-1-vadimp@nvidia.com>
        <20201007113105.GE12224@duo.ucw.cz>
        <20201007142049.02d8c3ba@nic.cz>
        <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
        <20201008075619.GB32424@amd>
        <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 8 Oct 2020 08:47:45 +0000
Vadim Pasternak <vadimp@nvidia.com> wrote:

> > 
> > But noone is currently using mlxreg123 in their applications, so that part is not
> > going in.  
> 
> Yes, this is true.
> I could modify it as:
> 
> 		if (priv->pdev->id > 0)
> 			sprintf(led_data->led_cdev_name, "%s%d:%s", "card",
> 				priv->pdev->id, data->label);
> 		else
> 			sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
> 				data->label);
> 

Vadim, the LED core constructs names in form
  device:color:function-enumerator
so if you must have number there, IMO it should be
  mlxreg:green:status-48
  mlxreg:green:status-56
  ...

Marek
