Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7DA47642C
	for <lists+linux-leds@lfdr.de>; Wed, 15 Dec 2021 22:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbhLOVEr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Dec 2021 16:04:47 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:33234 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbhLOVEq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Dec 2021 16:04:46 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 548E161ACE
        for <linux-leds@vger.kernel.org>; Wed, 15 Dec 2021 21:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B01AC36AE4;
        Wed, 15 Dec 2021 21:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639602285;
        bh=dOXty+UkQNqrmTDz8FMxj0q7wgA9ViFatbnTeHAEBME=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=J3IdhiFbJoe0fIafbC7LhHR1XJwGn0OE9kLljMGMA3GoNHd9T0uVMaY/xrKWqNqjT
         5WhYEwIn38W4dtHY2l0bmaDgJWjOFnnacAaYZE9HR/c0Q45chYGd1HYH+ZR+dBDHsb
         y9oFTCD2t3HRvrUO+u+H22r7KVJFCcI81QWu6MQFppcCMI1NyS0/7VHLwsdPkO/i/b
         /Yg5P3y37KsRVVl/2M2CtRn0oH5zyxe9N6NbUW+mTxtDJkzT4c3PAzYQy4lu96/Y8t
         JJ8/HgjW9UbZ/IWsw1ZQHDW52MO7eJzC91uHQhcekhq2F3N04gCEMzzxckGMTCoZZQ
         KCqxQfweCJ/OQ==
Date:   Wed, 15 Dec 2021 22:04:41 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        simon.guinot@sequanux.org, linux-leds@vger.kernel.org,
        j.anaszewski@samsung.com
Subject: Re: [bug report] leds: ns2: Remove work queue
Message-ID: <20211215220441.2d83299a@thinkpad>
In-Reply-To: <20211215203955.GG28336@duo.ucw.cz>
References: <20211210135249.GA16777@kili>
        <20211215203955.GG28336@duo.ucw.cz>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 15 Dec 2021 21:39:55 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > Hello LED devs,
> > 
> > The patch c29e650b3af2: "leds: ns2: Remove work queue" from Nov 20,
> > 2015, leads to the following Smatch static checker warning:
> > 
> > 	drivers/leds/leds-ns2.c:96 ns2_led_set_mode()
> > 	warn: sleeping in atomic context  
> 
> Yup, this looks wrong.
> 
> Plus, the code is quite crazy.
> 
> Not sure what the write_lock in that function is supposed to protect
> against. Perhaps it can be just removed?
> 
> Hmm. led_set_mode uses custom interface for hardware accelerated
> LED. Ideally there's more fixing to be done there :-(.

The last time we discussed this, Simon said that he is willing to
convert once we have trigger offloading API. But we will also need
blkdev trigger. Time to review Ian Pilcher's last attempt at blkdev?
  [RESEND PATCH v8 0/2] Introduce block device LED trigger
  https://lore.kernel.org/linux-leds/20211119212733.286427-1-arequipeno@gmail.com/

Marek
