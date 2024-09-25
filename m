Return-Path: <linux-leds+bounces-2805-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6289860B0
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2024 16:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABB421F24DB6
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2024 14:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0067118C346;
	Wed, 25 Sep 2024 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b="PhS2GHo6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E55B18C356
	for <linux-leds@vger.kernel.org>; Wed, 25 Sep 2024 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727270516; cv=none; b=TzlqyhDsLbcYxwh0q+i7h+pDFD4kh7Z9Rvn1JxjNaQj9VEJl+2zNgi3bYq24KavmHoXlxF+zdTz3Yr22NswnC6ht649N7LkJgGwe56gGQ8bUZbC3pe0K1zqHy9K3jt8b4zuj2y/9sXI4RW/87N7hH3CyrdOTtDyxz4Eshn5acZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727270516; c=relaxed/simple;
	bh=80nRf1yN61EyTIF/bCAMTs4Xo6b6+r0ans7RnhxfGqo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=ClU4WeffWWNy9N1fSVaRzBJH7dTSE76n2VbvxWe5AWG8kiIJt3zUFJM+JGO02nv33ZuTvfkyKlLdlCmEyRCxtHxYVfbSNvgiroH6pYzwst3EP8wfEetiuyp2dng/WHaTqqdrqPpDOJHkJshJF7dlek24BeoInpRL+fFwWCBOrI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b=PhS2GHo6; arc=none smtp.client-ip=185.136.64.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202409251241313d4c647138ed236d73
        for <linux-leds@vger.kernel.org>;
        Wed, 25 Sep 2024 14:41:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=diogo.ivo@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=nD23HHVf6NN9+nbCQYESPtht7k5g44Z+r7fM32TQvYM=;
 b=PhS2GHo6wjeCYcUqcgFzjoLc3kr69/Xf1Tvni/zRelZVn/h3pLPTIXEAjU9gyVufPUn+r5
 zJfLn5VGgNvYta/XO3R+gQJ3NDkSJiqcpTyzOiF3x1ccaRvvSTRoRbCx3xWETEG/aTcTjNgd
 G6DMWLrV5WAOGK8E5Imix+dh4EyWheikvve2WZfif9Lq+DB2L4gihtZRmXVCIEEKAL4gNJ1g
 5NfqcLvEFGXyypKBuFAx0VuDv1JNCZu/8FQAWHZR5zUTmR8KH+C69F/Ge0Ru6sb128Sun7au
 uVGYXBJveAqgsjDs4LQcC3YPnpIDjelFgYl2SuQqJtRlqjqSTK0dQ8Nw==;
Message-ID: <1ef1d479-a96a-4371-99e6-f69bf0bd0a89@siemens.com>
Date: Wed, 25 Sep 2024 13:41:30 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@siemens.com>
Subject: Enable leds-group-multicolor as panic-indicator
To: pavel@ucw.cz, lee@kernel.org, jjhiblot@traphandler.com,
 sven.schwermer@disruptive-technologies.com, linux-leds@vger.kernel.org
Cc: "Kiszka, Jan (T CED)" <jan.kiszka@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1320519:519-21489:flowmailer

Hi,

Building off of the leds-group-multicolor driver it may be useful for 
some platforms (such as Siemens' IOT2050) to use such an LED grouping as 
a panic-indicator LED.

Currently the main blocker for this is that leds-group-multicolor 
implements .brightness_set_blocking(), which cannot be used in the panic 
path. From my current understanding there is nothing stopping converting 
the current implementation of the callback into .brightness_set(), since 
it already calls the non-blocking led_set_brightness().

However, looking into the similar driver leds-pwm-multicolor on which 
leds-group-multicolor seems to be based there is a mutex on its 
callback, which raises the question if this mutex is also needed on 
group-multicolor (which would impede the callback conversion) and, if 
so, what does it guard against?

Thank you for your help!

Diogo

