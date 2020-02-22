Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33AAB168E20
	for <lists+linux-leds@lfdr.de>; Sat, 22 Feb 2020 11:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgBVKFs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Sat, 22 Feb 2020 05:05:48 -0500
Received: from mx2.suse.de ([195.135.220.15]:48310 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726675AbgBVKFs (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 22 Feb 2020 05:05:48 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 7357CADF8;
        Sat, 22 Feb 2020 10:05:46 +0000 (UTC)
Date:   Sat, 22 Feb 2020 11:05:45 +0100
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4] leds: add SGI IP30 led support
Message-Id: <20200222110545.fc96683543cb0dd538e5be82@suse.de>
In-Reply-To: <49524a9a-910a-9f1a-bc10-d78080a16d46@gmail.com>
References: <20200221111120.28799-1-tbogendoerfer@suse.de>
        <49524a9a-910a-9f1a-bc10-d78080a16d46@gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 21 Feb 2020 21:31:04 +0100
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:


> > +	if (num == 0)
> > +		data->cdev.name = "white:indicator";
> > +	else
> > +		data->cdev.name = "red:indicator";
> 
> Why indicator? Whereas it sounds quite generic it is used in the LED
> subsystem specifically for naming indicator LEDs, that are often
> found on flash LED controllers and are designed to indicate camera
> sensor activity.

ok, ic.

> If it is on the front panel of SGI Octane workstations then its
> function is perhaps well known?

the red LED is clearly a fault led. The white LED will be switch on
after system diagnostic was successfull. Nothing from common.h really
fits that, maybe status ?

Thomas.

-- 
SUSE Software Solutions Germany GmbH
HRB 36809 (AG Nürnberg)
Geschäftsführer: Felix Imendörffer
