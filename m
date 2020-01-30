Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9EDB14D922
	for <lists+linux-leds@lfdr.de>; Thu, 30 Jan 2020 11:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgA3KhV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 30 Jan 2020 05:37:21 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:47118 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbgA3KhV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 Jan 2020 05:37:21 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7B8A21C25F4; Thu, 30 Jan 2020 11:37:20 +0100 (CET)
Date:   Thu, 30 Jan 2020 11:37:20 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: How to synchronize leds in trigger
Message-ID: <20200130103720.5uecvirjqeeaemrv@ucw.cz>
References: <69050f67-b611-dfd9-b166-a0d51edc18e2@kaa.org.ua>
 <d44bcd3c-bc6f-9168-bfbd-c71469d5e771@gmail.com>
 <54c07894-f302-fe1e-9f03-aa30ea1abca1@kaa.org.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54c07894-f302-fe1e-9f03-aa30ea1abca1@kaa.org.ua>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> > What prevents you from solving this problem in userspace?
> 
> User-space don't fast enough to provide correct timings.

That's hard to believe.

							Pavel


