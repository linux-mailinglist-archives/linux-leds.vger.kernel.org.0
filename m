Return-Path: <linux-leds+bounces-226-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1899C800897
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 11:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E00FB211D1
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 10:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C9018625;
	Fri,  1 Dec 2023 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzpYq/eF"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80AB20B20;
	Fri,  1 Dec 2023 10:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4292C433C7;
	Fri,  1 Dec 2023 10:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701427241;
	bh=coe4HPytXXikBmxRXD89EWbUr+6HRrfFw+tus7gam/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UzpYq/eFuk3rit5uhu9SRPzNMXFWDiwZqUtyB60JxgJQpR5S/zYGKl+nPDJb0GWyy
	 Og+mGMgIsLREDCAbkKFbDDDlZ71xUVLWqzx9xvywQTxAcOvcdKPsi80ZO0dkn66qEg
	 PBCI85xt8sWvTeOcn0IV1YIBjoR9aDPTs/6EzcBBXS5M3fOambqPqhl8pBNx9d2mKC
	 cPYpVbhVwz06lrTYBwMXMNzo58R07Syta+VQygfvOXNFISk3ggl8r6JTSK42L6nWED
	 mr+12vwyW2f/4/NYGMrEgMOXedYKEPxUQXSFN4dq7ddxYxMUgQ8kgq8qSm+rdCndU9
	 R1Wh4AH/xStTw==
From: Lee Jones <lee@kernel.org>
To: Eckert.Florian@googlemail.com, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, pavel@ucw.cz, lee@kernel.org, kabel@kernel.org, 
 u.kleine-koenig@pengutronix.de, m.brock@vanmierlo.com, 
 Florian Eckert <fe@dev.tdt.de>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-leds@vger.kernel.org
In-Reply-To: <20231109085038.371977-1-fe@dev.tdt.de>
References: <20231109085038.371977-1-fe@dev.tdt.de>
Subject: Re: [Patch v8 0/6] ledtrig-tty: add additional tty state
 evaluation
Message-Id: <170142723852.3350831.6373465907279189004.b4-ty@kernel.org>
Date: Fri, 01 Dec 2023 10:40:38 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Thu, 09 Nov 2023 09:50:32 +0100, Florian Eckert wrote:
> Changes in v8:
> ==============
> - As requested by greg k-h [6], I have send the patch 2/7 of this series
>   about the memory leak also to stable.vger.kernel.org [7]. This has
>   already received a 'Reviewed-by' from Uwe [8].
> - As requested by Maarten, I have adopted his suggestion to invert the LED
>   blink, so that I do not have to save the 'state' in the tty data
>   struct [9].
> 
> [...]

Applied, thanks!

[1/6] tty: add new helper function tty_get_tiocm
      commit: 5d11a4709f552fa139c2439fead05daeb064a6f4
[2/6] leds: ledtrig-tty: free allocated ttyname buffer on deactivate
      (no commit info)
[3/6] leds: ledtrig-tty: change logging if get icount failed
      (no commit info)
[4/6] leds: ledtrig-tty: replace mutex with completion
      (no commit info)
[5/6] leds: ledtrig-tty: make rx tx activitate configurable
      (no commit info)
[6/6] leds: ledtrig-tty: add additional line state evaluation
      (no commit info)

--
Lee Jones [李琼斯]


