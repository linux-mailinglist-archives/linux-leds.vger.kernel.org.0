Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1F3319FEE0
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2020 22:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgDFUNH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Apr 2020 16:13:07 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37928 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgDFUNH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Apr 2020 16:13:07 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DAE1A1C47B3; Mon,  6 Apr 2020 22:13:05 +0200 (CEST)
Date:   Mon, 6 Apr 2020 22:13:03 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 03/18] leds: Add multicolor ID to the color ID list
Message-ID: <20200406201303.GF18036@bug>
References: <20200402204311.14998-1-dmurphy@ti.com>
 <20200402204311.14998-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402204311.14998-4-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu 2020-04-02 15:42:56, Dan Murphy wrote:
> Add a new color ID that is declared as MULTICOLOR as with the
> multicolor framework declaring a definitive color is not accurate
> as the node can contain multiple colors.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Squash with previous patch, ack for both, they can't be separate.

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
