Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56966CCD6E
	for <lists+linux-leds@lfdr.de>; Sun,  6 Oct 2019 02:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfJFAUL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 5 Oct 2019 20:20:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:41774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726876AbfJFAUL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 5 Oct 2019 20:20:11 -0400
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07CB5222C8;
        Sun,  6 Oct 2019 00:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570321206;
        bh=qQ+AM7HzTxUatAdVYalvXuoGaXRz+y1gBg/GtTj6Ly0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IT94Vl4UeNiaxnAbEub0yaKVQCYfGFVYkKazdQwfLNbPy/C6nLnSoqGZg/UpeeHAo
         oHTJBQToZ94hp52JtZSPUL6MbpnnNh3x9zuyuKPaaKMtU7iPCzceU0aRvmjErAaGmh
         GMEKwVTY/vua6Qsmu1psHg8iMLS8CJWCLdrbU+so=
Date:   Sun, 6 Oct 2019 08:19:50 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com
Subject: Re: [PATCH V2] arm64: dts: imx8mn-ddr4-evk: Enable GPIO LED
Message-ID: <20191006001948.GC7150@dragon>
References: <1567517277-30919-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567517277-30919-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 03, 2019 at 09:27:57AM -0400, Anson Huang wrote:
> i.MX8MN DDR4 EVK board has a GPIO LED to indicate status,
> add support for it.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
