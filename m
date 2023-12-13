Return-Path: <linux-leds+bounces-352-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C99F810DC3
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 10:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE5752814B9
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 09:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC091219E1;
	Wed, 13 Dec 2023 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xs16dtut"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8202B83;
	Wed, 13 Dec 2023 01:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=J53kTNMBvWEkAO/bSUp7Ho2Y3MLseFzQQVNG/4UK0Uw=; b=xs16dtutLZRses+U1JMjvO+WNv
	9tdmBTTHg4/FSnoPksh8/UxwCbPph883G8hNNDJ5/p4VCYMYozo3idi/h2t/ZfaVrfc8MmhHFElho
	j2Pp8N64uiWn4OXnMHEufJz/v/VVmUiBq+R4SjgDq9XuYafO1Py6J4JZZxaq4RwkprH0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rDLyM-002ntF-1O; Wed, 13 Dec 2023 10:56:10 +0100
Date: Wed, 13 Dec 2023 10:56:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Li Zetao <lizetao1@huawei.com>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH v3 1/2] leds: trigger: netdev: extend speeds up to 10G
Message-ID: <d72e5e51-b5e4-4527-bd13-7176b2e21fb7@lunn.ch>
References: <99e7d3304c6bba7f4863a4a80764a869855f2085.1701143925.git.daniel@makrotopia.org>
 <170142826116.3357002.9561246405642038358.b4-ty@kernel.org>
 <6577315e.050a0220.50f30.0122@mx.google.com>
 <20231211084656.26578d89@kernel.org>
 <657784f6.5d0a0220.617b5.20ee@mx.google.com>
 <20231211140546.5c39b819@kernel.org>
 <65778a83.050a0220.b2844.2af7@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65778a83.050a0220.b2844.2af7@mx.google.com>

> Thanks for the explaination... Sad... guess I have to wait, hoped I
> could have the qca808x series before proposing the at803x driver split
> but I guess it's not possible... Maybe I can try pushing the change for
> link_1000 for now and later add link_2500 ?

Yes, that is O.K. It should do link_2500 in software, and since it is
a static on/off, should cost nothing.

  Andrew

