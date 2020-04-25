Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE041B8928
	for <lists+linux-leds@lfdr.de>; Sat, 25 Apr 2020 21:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgDYTxc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 25 Apr 2020 15:53:32 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:40754 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgDYTxc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 25 Apr 2020 15:53:32 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0A5ED1C0239; Sat, 25 Apr 2020 21:53:31 +0200 (CEST)
Date:   Sat, 25 Apr 2020 21:53:28 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 03/17] leds: multicolor: Introduce a multicolor class
 definition
Message-ID: <20200425195328.GB1143@bug>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423155524.13971-4-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> Introduce a multicolor class that groups colored LEDs
> within a LED node.
> 
> The multi color class groups monochrome LEDs and allows controlling two
> aspects of the final combined color: hue and lightness. The former is
> controlled via color_intensity file and the latter is controlled
> via brightness file.

It is now multi_intensity, AFAICT.
									Pavel
