Return-Path: <linux-leds+bounces-7615-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLsGDcUdzGnHPgYAu9opvQ
	(envelope-from <linux-leds+bounces-7615-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 21:17:25 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 236BC37075D
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 21:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3AFB300A661
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 19:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25A7390985;
	Tue, 31 Mar 2026 19:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="IxOhi8tj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DF7377542;
	Tue, 31 Mar 2026 19:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984639; cv=none; b=jcgmbadcpWgqMbJsUoKaMJyBjm0ExxS8DjxNg90f4mmMB0byrHmUpva+MuCGXzwJ8isoLgpeCUgKIqhJ34Ecb0re7d8teKiC4CUmLq4R9bBCpSOJMOOTZ2gSkET9YVx1VkqrxfjRg53d3/SuufTDA3NGtTLxat3fFAFqdgqpl9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984639; c=relaxed/simple;
	bh=pjtkOG0gKhRzQcowTQula5NQOWdFKhqgnfQ4Xaxqy1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lURqf+2DruQ43nHOhU/RZZWsZC0Osl/2xWNq/Vbr54af7i3CFSIdNSEO4DKk+tSKEA/6PShvCWxvqPeLadpjL77fkH+TjrVVALoEsjzNA2O7xKqLXE+zKHEz5/HWZsS3ALwOj5sSe746gaospgDW1hXd0PyNRIJZU+h7PALy0eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=IxOhi8tj; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774984634; x=1775589434; i=w_armin@gmx.de;
	bh=nkSvRsorb1Yk4PVep4ncZgQzA+5lV7SwerFdosz08zY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IxOhi8tjzEaVaQ6AjzluzNTzouMi8QdNZ1XpLOCCXXhgCMMaxIktVVmcDFbH3zsv
	 Lb3PBnyNwyyzalREHFr1NzZ0xMUsQ1wfiAIzIc+nWC6oDBDTEmvrE9SgrvhewWD8C
	 t80+BgzTWUItcZ8f78ifK+rdDJ6NuFyYKcOGKtxfT68lmBPK+xLtI9dmMSSFPRkoW
	 PguNjOqlidpkkAcuRphoWVq/klLH77hqdibXZ+JfDDVuPP5ESN7eGykjPuJ5IGxSm
	 Nr5km3v+uez0GxBQX3zo/UL8XlAyuR1AwrOc8YJ3psuUYRednDrmrE5Y7XwBE7Djb
	 0KjIugQXh/R3WUOJ7w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZCb5-1w3c7M3iaX-00T7JF; Tue, 31
 Mar 2026 21:17:13 +0200
Message-ID: <51fc36a8-cdde-4507-a5a4-c095aa00d8e8@gmx.de>
Date: Tue, 31 Mar 2026 21:17:12 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] leds: Introduce the multi_max_intensity sysfs
 attribute
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, wse@tuxedocomputers.com,
 jacek.anaszewski@gmail.com, pobrn@protonmail.com, m.tretter@pengutronix.de
References: <20260324202751.6486-1-W_Armin@gmx.de>
 <20260324202751.6486-2-W_Armin@gmx.de> <20260331103822.GC3795166@google.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260331103822.GC3795166@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AT4OppukAVQWHMq7tyTMSVfaETLibbTWofvpp9UqXLiLPXy1UeL
 MXmpb00vA1SnrQjNOuEbYXqnZ4ooJH4MSkzXAuS55NTvTgI4I2fB5Vf0dCNCG7ZV2842uKv
 toJyoZ2J7+NYfjAbqcjKCgf5N1bpkbvnYy3V6nF44CsapnWJsBNViOqn+UnWyPaR9723zbO
 BcDLIbnW9ND62eRKnOu1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:darn9f4CHN8=;Vv/UMt2fQMtm3ysvVHUdFC2jlaM
 YEIPBYNMyhA+LYP8edMSePQUSMsJWmdpHIICqaeqd4FiIIvYwAP9UWsRtiu9RgUdnUHJFM26L
 YnMPQYLK7onTAxrWkhbwmJZzHG/+m5eZ/rcPAZjCcGHObnyEJfC8aV0AsfMIe/doxfaksFYGu
 4K9EINMoYWnlUNmwiUptqNabupX//65mjxpOYYzqyj+DfVo1F9otw6zyiQGpEhZbKHBC0zS7Y
 Wwy6uUDEyKo4a3+eysodhNgaQVT33VM7CkpaJN3POTFRyQqBGVV3pnmR1GpML/jj4x8nnFkw8
 nk0MDIfaS0qPWhPsblYqLxgktpSsE9am3NxICB5lUjPiDmEdeV0MMYUzR224OmUdvg9BOzTOw
 Id9flgvkSz2giAgvnKB6aYy5D+GTY6+vqaW60fxujWiDWH+ctxpFM83j0gRATduLAWAiTmXmu
 XFLXT3auloTBLInSlB3uxIrjf5tOCYZzre0mvUc0UnenNdV87PDZR2+8+uHm+iyeSlMkkVTE3
 3qK4sBeF1UfMlJtV7sSotXsYD4zGpGoHMG/WuExDp2Aq6/lw2fDmL5OO9nWU20ngWJhvOzOeP
 9N71U+pMsBbLB8G8noAbVVyf23z/A4ZOj5urWJcQS9M/hdXkxkD0I6G7U82nV7hRPXULNcm3c
 QoPNkVriFSOBnXML01kt56Czu/w3S88IGlPqBo5GJT5T940Tq1nS39rgqvLEY0kmBShVaOkZ8
 dA/1dfbDzbV1EOk1JP5jqUwWWZGT53RPTfFpOedKze0Xx+OGcvt7X8BVSEe4cdfx4zM9DENFA
 IykFQE4QSrYDm/1VfYE7MqDweLm6q3pI/LqyhVJ3PsgQKVefgAGz9a0c6WCAdRIa2/XVOhitu
 zH33CtmcOVXZXOuIbiSQAp7BHGXtO544MTS8ts8YqPDmuKCiNXgmd137ZbJf5QxS7aQ6R2RHb
 dPDD7OvUHifF1/rUjKGOAacA8eDnUm63bHsL6SGu0xCGuiTjAsSBtsesCLM/OPik9E3Bsn9PW
 rk4cqtFcw37zcxFcapBD4YTsjkH0TMT02lwXBuuv1kOgsyz8U75U2ZZvwDqvQhvN8v0clzN/u
 Y3kZ8r+4WjTc/z2qUh2AfMFlKddYpFDefZuZqx14vuACCFyYgosJAL5f4h9x+jHVZDfUvtW20
 d8Zk1r8JiRVAumZpGs6M7QOQdJoqXgzZAYyCJoZruhBhvoCdZgtIQKW6mTayfxJwAby1Ugg0k
 kfRw8hcNzmxEKRqeSxaM1rgqP4NQ2iTZ6m1BZtdWdCXRuOiGvV6fMZCjjRyuK5yincA1Zoep/
 QQdIsUwcopgZJSeTKu6lX2el0WAleV/CvYwsCjXwDrcdmNIw/yJsWsU0wMbHlu8MB8G2gHbBi
 aFYZ0RNY9BFwuJcd29yhAs9cCqy6kBd2uZfZQ8v3ybp88jpEs5ht6QVYnxj8AbHhZjAq/1cOU
 UQT3PEwRpdTEPCDmNxgf+Ytmv78JeAq/utw2Ld7ontblDDpeLfMUTUOvsKhRzDIjqOr549HZK
 z5v72748I1MnfLuRZDk5FT4eWPbniNfTFwlgW6xnUcU0gpSSSyW7aU6M/6W1BKf2nMk2Mx+gQ
 QqIsgVTFrP26KW+S3eoY9X59xwgSdSLGb9CWmv6wZv0JzNRKrMKKSCx5FggrZ/a/6FeCC/yLY
 q48MWPa/bpd8KH+X+wbQ+/MkAItOu1FLbiZRN/0VVEW6LohOwWCFkfyufGQPFcnSaV7hAUb3x
 Bc2ut+nhfohi17teXDwrZZq12CF83TmmFarDGcR/h41gYgMEo7+P0yQKvIP10CdqtxxsjZUWg
 EvAnQj3feC7wYWunC2qYPWQjDgFU9MRr2swAm5qLYM3EOYGemtUvjUQVbk5q7LNZdBSFrHfyb
 2S/0zahGhLKdzWxmdQx4uOE5cF7JVIKXJa0SExDoh2ZrPs06ogavExhzj3iV9jAD1j8obZFar
 +h39HC11Br8r1bk60riLnzWC3lJ33D2CnRxT3o8a0U6KK8Le8TL+iTeZFCk1EW1UZujCZi/Xp
 dn7wRgVxn61CrkkdsKnd30ijruniskATctujzT/h03C3b8kY4IlpVQ4ApqrtvvoUxhxAW4AwE
 14dmOJUx+5nqJPKZmx+DN50XmkqPWefJzb2HIeJAN95hKGRycjgYfcj9srBkZRO+2DqGE6agr
 RhgV19pTyJjLeaCO5Zu27tdYOjcWZB3ch0wHMWPzR9yLibpzly9P4fdayHYoT8nsnujR7GOVq
 sK8oYyS4t9xLJ2/wpBD/Q7ls07meMGGY1WLu/M0mmBcpdkimN4dLxprRq1A/WUbvqFkYjcYQg
 7BYERRfcaSytjaCew5iOJCTbaCdBW/3LYJbSK1fnuVhQ/CpMGD/MP+9ZAHBe21T/NdMT/zFef
 PFqpmJs7KX1YI4ihygBmn7v2/+k/dLeUG7OYST6aJ8NLWekZbWsUAtzIsmTt/xVfYtNPBoWbq
 FcxvrmJpKyLJIBt+9dLPSuOuHm+zx8+J+L1TPjRAFEhO3kuxU7LIxOxXrgGXY6OKzwxbCNq93
 EUFoa7bekwSrTjiOMPxd3Dnbh7El8uZsyUtsk0JglMuBMNyTcyGGcfBOYMghqjqPKUWbBav9J
 HvP8h+90XBmF0aVLIJr4MkzsgkoEi/PuytMq/08rXasuMEdeFhtXRGiRFDDmLF9jXrbSXmM6e
 Uc76PSNl7+N//tO9EU+rn5ICf9wAfieEOWA6joH/eY7obaSaJqCRMegFH+eGxNiOSuel672zO
 vi7RrRGn/qRzANAhfH3uXri5ywclP//QqEV96uBeKFs/IX8CCO8aopr9nyAqSTrjKXct8mnqU
 W/37tj/l5DEvbx4akMa4L8jH7dXR9Cl5JjrU3+VHUD/JLCtKOrMBTFGhGUwKULcKVhCQ+nXIC
 u+Nt2HdvWnJjeWgsmCcNckqQyXVHHB+XCyTkudnF4zTX0qCvg414XNqT7D4f86/6BUkRMOkTf
 OcZivssiZh9Rckna2JEUDpM6NZ0WZ4y1flX7mxsyEe+Xwe1s4vvMeskpQeBb4qMJXvTuTxeu1
 atiPCP9luad++L3zJedWBnjJBtIWKurheShLYhD+5XOaue7tMWOTusyiYKcjoXp5w2ArlrHRw
 KWN9G1VyNcF/quNaqbW218V55X9K9YedjroDfNt/2R5JD+MfwFtHjHCjB8fMl761REsLSQqci
 ujtCUncm5q7PgBoFyHFIvGzCoc08NSY0bcQ4RXxamd+2ERA+T61CAqXeL5dsACTJlC88VIC0F
 iBbAEr+iBnHBMCxcDZGuOOV9bRtT5U1KvzdDDkimfksLfsMh2t02IYKnBozOrnyfUdGeOai6s
 QcYOB198g5UDjrcrmugS0+wjscNC/KOsa6U9qE4BPuEi/cBwD9gl6YxowvmQE+mYSJ4nXzkrS
 +ynzx/KTVOdmBWQy1m4Q4rgCghmah3OizXMm2ORsZPX+6+kIEOYOl3aA2hdhz9hoqvrThhsX2
 Q2t4cpeTjsvIFqRFeLTmJdOeufZFRz/UyG7Nupv2W5RaxOv9/D/HEM9SAMm8mWyin8QHheyL3
 6ZtVaefsBl/eSNrw7MjedcCSnLiqYr8QHTIlJF7zGcbLYrwEQbmAuWLydoPhjEHxli/cG/YDQ
 oA+WrvvUdpC4sfU+/XlFOBbkCoGnsVhxQQI9ibm6Y57629/FBQgzP0aepyzFuK6Qu/a7u/8KD
 r4HdLVxAPuRYHfxexiSYvxPRvZb4TdDC5RNCW+5DADKJqc1EsSZ/x4Kw6Si9hUB8SaQcllBAp
 RrugIfNzPZ1hMrgEnofcmquvLLvBPJ8LHwrU9siiCf6dFs98S1XfmJxiL950s2G21nkR93dDj
 QS2YiKZQnZa1KDnmOkxvTd/8pGH0cRlbZDQTwUMe56NGTjTUS23c2E+SQCpSfx3kiPskpjUn/
 LfpSeQFfKNzs7+6BpjU4nc33uU0/AZO6kHdygnzGlyo+C0wWdPQvz70GBdaxMqpx44LpQi9Lj
 YqgPzSFcyaZpGX76VLIr8T+NXk1Xj21lm1clVqJ3Xb86eLIqhc1ZrmAOia/eMt8ipUrsqXJRe
 xxFxSWN6joJPnuK72w83z8MOOVFR+rTZGEq9GXlsmLUi/dRtm9Qy3tYtKcX0C6sTQAqig3B5h
 CHTwOli/qdHYMr8V3UGVyp0s+j9OqcfF3B1gmLSSwPg0Y7z3OC3M8HU368LQKgjjyNNA93832
 ypyAaa3v3kK0WwbBRIX4xCXWMrJ0mFXGObFT6cawuaFtun+4yuRF0TKjEioI4Lv5cpoWUdeoo
 DcYElNafa8gg+41doOBivDVgrM9wTkcnHEPZmZV7LMe3aL8lnG08EQhYNldlKOQ0NOMGlkpnR
 0wj02InAGgZZiK8sq3ogL26NkAwK5R61IeJ2s0I3/GEmjses1R1qRJQsJFr/Vok2Z68VHED8G
 c3oiyMDK14APbsO5WXL3GVlIXLexhUnIYqQpwmFQ14+b5psKG9PziYzSre4okaH1wAcxdSgR3
 WIuwchpa8cST9tz/p3yvjcRfX0lzp1FIgej/zbhrHu5YcLW/B8GbQYaVY2TAPu9zyHESNtU2I
 OyJaD/Bs/iZ0Gc4seJ/2duG1QeChdHm4gtxFINjsERxorLihlP/A8DW79Zvc2vsK+heA+OMDv
 KIAPCWjXQ2PZ/WsxFi+QIwau2qIrC3aYq6lm8QwgDL2imPdMm7FAFq7HarClPJrSiL02mnhxL
 ovlfj9PFaZutulzKpv7zCV9cT1kVKmTG60yh7y7gkJo7dfgzUqRVAOMtALTBIeLpsYeHB8tAx
 EQMFIzelh1JKB7GnWIcSNpKowLIuTuJ0ZoVM2FFuuJD5lWJ7mvxmQcyYtE5GUOCTKu8XO88ki
 CsovkjGnbWX18IgYm9k161Yoc92RsRTF3uTcWVjnfF7qLENbLB+M/K0On6fo8CA4fH8hvCY38
 4goad8MCwh0Aap5p8kMLmOffg9WWh5CaF1DaTYbByXC8WtM1+m5LnILerNQd7whEI48EpGL7g
 JZ8+9Snp4Hh8wwfxLRDn9cVigmzvSQUBLr5bdTO3fNCGeRUqGOOV4tBPMkQWMaM0TFbmFJJeD
 YsiEDYceBgrcC7QuilTALjMiDq7ZbGxZRQJkmAH3HHMwEPhX5pwxz8gYa+pxWLqHiJcsT8cfM
 JiSP28bpRy+YIZxLYpyhj2SLy8O9u225moloEzh/hW1VqD5uazKxBR6nyEy+FkMQaf0TPi0KZ
 Pw6WCribjw2u7PEDBrBzqH4EPwE0Ei3NdCqeK5g+XaVfql9sxrE2H4lXxcIJgzsrIHYl0Nk0G
 EZbxQuoxAxLeQuPw1+MNaZj4gnNkivnW/0F4qq63J1Yg6FW2M1+KwW18qREffhMwW3m5auOpJ
 nDGe+B6zy8rKiCVUCBk5APUZ6PRY+cZvRYqvXcPumPdOQxlfNxkv1isfVevj33uTcS7sdmwm6
 jJO5H6fsHqX55hsYZYFd8wDwXeX1vR9Fn+4qMvFMUIzEU=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7615-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lwn.net,linuxfoundation.org,tuxedocomputers.com,gmail.com,protonmail.com,pengutronix.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ti.com:email,gmx.de:dkim,gmx.de:email,gmx.de:mid]
X-Rspamd-Queue-Id: 236BC37075D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am 31.03.26 um 12:38 schrieb Lee Jones:

> On Tue, 24 Mar 2026, Armin Wolf wrote:
>
>> Some multicolor LEDs support global brightness control in hardware,
>> meaning that the maximum intensity of the color components is not
>> connected to the maximum global brightness. Such LEDs cannot be
>> described properly by the current multicolor LED class interface,
>> because it assumes that the maximum intensity of each color component
>> is described by the maximum global brightness of the LED.
>>
>> Fix this by introducing a new sysfs attribute called
>> "multi_max_intensity" holding the maximum intensity values for the
>> color components of a multicolor LED class device. Drivers can use
>> the new max_intensity field inside struct mc_subled to tell the
>> multicolor LED class code about those values. Intensity values written
>> by userspace applications will be limited to this maximum value.
>>
>> Drivers for multicolor LEDs that do not support global brightness
>> control in hardware might still want to use the maximum global LED
>> brightness supplied via devicetree as the maximum intensity of each
>> individual color component. Such drivers should set max_intensity
>> to 0 so that the multicolor LED core can act accordingly.
>>
>> The lp50xx and ncp5623 LED drivers already use hardware-based control
>> for the global LED brightness. Modify those drivers to correctly
>> initalize .max_intensity to avoid being limited to the maximum global
>> brightness supplied via devicetree.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   .../ABI/testing/sysfs-class-led-multicolor    | 19 ++++++--
>>   Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++-
>>   drivers/leds/led-class-multicolor.c           | 47 ++++++++++++++++++=
-
>>   drivers/leds/leds-lp50xx.c                    |  1 +
>>   drivers/leds/rgb/leds-ncp5623.c               |  4 +-
>>   include/linux/led-class-multicolor.h          | 30 +++++++++++-
>>   6 files changed, 113 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Doc=
umentation/ABI/testing/sysfs-class-led-multicolor
>> index 16fc827b10cb..197da3e775b4 100644
>> --- a/Documentation/ABI/testing/sysfs-class-led-multicolor
>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> @@ -16,9 +16,22 @@ Date:		March 2020
>>   KernelVersion:	5.9
>>   Contact:	Dan Murphy <dmurphy@ti.com>
>>   Description:	read/write
>> -		This file contains array of integers. Order of components is
>> -		described by the multi_index array. The maximum intensity should
>> -		not exceed /sys/class/leds/<led>/max_brightness.
>> +		This file contains an array of integers. The order of components
>> +		is described by the multi_index array. The maximum intensity value
>> +		supported by each color component is described by the multi_max_inte=
nsity
>> +		file. Writing intensity values larger than the maximum value of a
>> +		given color component will result in those values being clamped.
>> +
>> +		For additional details please refer to
>> +		Documentation/leds/leds-class-multicolor.rst.
>> +
>> +What:		/sys/class/leds/<led>/multi_max_intensity
>> +Date:		March 2026
>> +KernelVersion:	7.1
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:	read
>> +		This file contains an array of integers describing the maximum
>> +		intensity value for each intensity component.
>>   		For additional details please refer to
>>   		Documentation/leds/leds-class-multicolor.rst.
>> diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentati=
on/leds/leds-class-multicolor.rst
>> index c6b47b4093c4..8f42f10078ad 100644
>> --- a/Documentation/leds/leds-class-multicolor.rst
>> +++ b/Documentation/leds/leds-class-multicolor.rst
>> @@ -25,10 +25,14 @@ color name to indexed value.
>>   The ``multi_index`` file is an array that contains the string list of=
 the colors as
>>   they are defined in each ``multi_*`` array file.
>>  =20
>> -The ``multi_intensity`` is an array that can be read or written to for=
 the
>> +The ``multi_intensity`` file is an array that can be read or written t=
o for the
>>   individual color intensities.  All elements within this array must be=
 written in
>>   order for the color LED intensities to be updated.
>>  =20
>> +The ``multi_max_intensity`` file is an array that contains the maximum=
 intensity
>> +value supported by each color intensity. Intensity values above this w=
ill be
>> +automatically clamped into the supported range.
>> +
>>   Directory Layout Example
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>   .. code-block:: console
>> @@ -38,6 +42,7 @@ Directory Layout Example
>>       -r--r--r--    1 root     root          4096 Oct 19 16:16 max_brig=
htness
>>       -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_in=
dex
>>       -rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_in=
tensity
>> +    -r--r--r--    1 root     root          4096 OCt 19 16:16 multi_max=
_intensity
> Nit: Oct

Good catch, will fix.

>>  =20
>>   ..
>>  =20
>> @@ -104,3 +109,17 @@ the color LED group.
>>       128
>>  =20
>>   ..
>> +
>> +Writing intensity values larger than the maximum specified in ``multi_=
max_intensity``
>> +will result in those values being clamped into the supported range.
>> +
>> +.. code-block:: console
>> +
>> +   # cat /sys/class/leds/multicolor:status/multi_max_intensity
>> +   255 255 255
>> +
>> +   # echo 512 512 512 > /sys/class/leds/multicolor:status/multi_intens=
ity
>> +   # cat /sys/class/leds/multicolor:status/multi_intensity
>> +   255 255 255
>> +
>> +..
>> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-cla=
ss-multicolor.c
>> index 6b671f3f9c61..13a35e6a28df 100644
>> --- a/drivers/leds/led-class-multicolor.c
>> +++ b/drivers/leds/led-class-multicolor.c
>> @@ -7,10 +7,28 @@
>>   #include <linux/init.h>
>>   #include <linux/led-class-multicolor.h>
>>   #include <linux/math.h>
>> +#include <linux/minmax.h>
>>   #include <linux/module.h>
>>   #include <linux/slab.h>
>>   #include <linux/uaccess.h>
>>  =20
>> +static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *m=
cled_cdev, size_t index)
>> +{
>> +	unsigned int max_intensity;
>> +
>> +	/* The maximum global brightness value might still be changed by
>> +	 * led_classdev_register_ext() using devicetree properties. This
>> +	 * prevents us from changing subled_info[X].max_intensity when
>> +	 * registering a multicolor LED class device, so we have to do
>> +	 * this during runtime.
>> +	 */
>> +	max_intensity =3D mcled_cdev->subled_info[index].max_intensity;
>> +	if (max_intensity)
>> +		return max_intensity;
>> +
>> +	return mcled_cdev->led_cdev.max_brightness;
>> +}
>> +
>>   int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>>   				 enum led_brightness brightness)
>>   {
>> @@ -27,6 +45,27 @@ int led_mc_calc_color_components(struct led_classdev=
_mc *mcled_cdev,
>>   }
>>   EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
>>  =20
>> +static ssize_t multi_max_intensity_show(struct device *dev,
>> +					struct device_attribute *intensity_attr, char *buf)
>> +{
>> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>> +	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
>> +	unsigned int max_intensity;
>> +	int len =3D 0;
>> +	int i;
>> +
>> +	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
>> +		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
>> +		len +=3D sprintf(buf + len, "%u", max_intensity);
>> +		if (i < mcled_cdev->num_colors - 1)
>> +			len +=3D sprintf(buf + len, " ");
>> +	}
> This should be 'sysfs_emit_at()'.

Ok.

>> +
>> +	buf[len++] =3D '\n';
>> +	return len;
>> +}
>> +static DEVICE_ATTR_RO(multi_max_intensity);
>> +
>>   static ssize_t multi_intensity_store(struct device *dev,
>>   				struct device_attribute *intensity_attr,
>>   				const char *buf, size_t size)
>> @@ -35,6 +74,7 @@ static ssize_t multi_intensity_store(struct device *d=
ev,
>>   	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
>>   	int nrchars, offset =3D 0;
>>   	unsigned int intensity_value[LED_COLOR_ID_MAX];
>> +	unsigned int max_intensity;
>>   	int i;
>>   	ssize_t ret;
>>  =20
>> @@ -56,8 +96,10 @@ static ssize_t multi_intensity_store(struct device *=
dev,
>>   		goto err_out;
>>   	}
>>  =20
>> -	for (i =3D 0; i < mcled_cdev->num_colors; i++)
>> -		mcled_cdev->subled_info[i].intensity =3D intensity_value[i];
>> +	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
>> +		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
>> +		mcled_cdev->subled_info[i].intensity =3D min(intensity_value[i], max=
_intensity);
>> +	}
>>  =20
>>   	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
>>   		led_set_brightness(led_cdev, led_cdev->brightness);
>> @@ -111,6 +153,7 @@ static ssize_t multi_index_show(struct device *dev,
>>   static DEVICE_ATTR_RO(multi_index);
>>  =20
>>   static struct attribute *led_multicolor_attrs[] =3D {
>> +	&dev_attr_multi_max_intensity.attr,
>>   	&dev_attr_multi_intensity.attr,
>>   	&dev_attr_multi_index.attr,
>>   	NULL,
>> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
>> index e2a9c8592953..69c3550f1a31 100644
>> --- a/drivers/leds/leds-lp50xx.c
>> +++ b/drivers/leds/leds-lp50xx.c
>> @@ -525,6 +525,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>>   			}
>>  =20
>>   			mc_led_info[multi_index].color_index =3D color_id;
>> +			mc_led_info[multi_index].max_intensity =3D 255;
>>   			num_colors++;
>>   		}
>>  =20
>> diff --git a/drivers/leds/rgb/leds-ncp5623.c b/drivers/leds/rgb/leds-nc=
p5623.c
>> index 85d6be6fff2b..f2528f06507d 100644
>> --- a/drivers/leds/rgb/leds-ncp5623.c
>> +++ b/drivers/leds/rgb/leds-ncp5623.c
>> @@ -56,8 +56,7 @@ static int ncp5623_brightness_set(struct led_classdev=
 *cdev,
>>   	for (int i =3D 0; i < mc_cdev->num_colors; i++) {
>>   		ret =3D ncp5623_write(ncp->client,
>>   				    NCP5623_PWM_REG(mc_cdev->subled_info[i].channel),
>> -				    min(mc_cdev->subled_info[i].intensity,
>> -					NCP5623_MAX_BRIGHTNESS));
>> +				    mc_cdev->subled_info[i].intensity);
>>   		if (ret)
>>   			return ret;
>>   	}
>> @@ -190,6 +189,7 @@ static int ncp5623_probe(struct i2c_client *client)
>>   			goto release_led_node;
>>  =20
>>   		subled_info[ncp->mc_dev.num_colors].channel =3D reg;
>> +		subled_info[ncp->mc_dev.num_colors].max_intensity =3D NCP5623_MAX_BR=
IGHTNESS;
>>   		subled_info[ncp->mc_dev.num_colors++].color_index =3D color_index;
>>   	}
>>  =20
>> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-c=
lass-multicolor.h
>> index db9f34c6736e..26f6d20b887d 100644
>> --- a/include/linux/led-class-multicolor.h
>> +++ b/include/linux/led-class-multicolor.h
>> @@ -9,10 +9,31 @@
>>   #include <linux/leds.h>
>>   #include <dt-bindings/leds/common.h>
>>  =20
>> +/**
>> + * struct mc_subled - Color component description.
>> + * @color_index: Color ID.
>> + * @brightness: Scaled intensity.
>> + * @intensity: Current intensity.
>> + * @max_intensity: Maximum supported intensity value.
>> + * @channel: Channel index.
>> + *
>> + * Describes a color component of a multicolor LED. Many multicolor LE=
Ds
>> + * do no support gobal brightness control in hardware, so they use
>> + * the brightness field in connection with led_mc_calc_color_component=
s()
>> + * to perform the intensity scaling in software.
>> + * Such drivers should set max_intensity to 0 to signal the multicolor=
 LED core
>> + * that the maximum global brightness of the LED class device should b=
e used for
>> + * limiting incoming intensity values.
>> + *
>> + * Multicolor LEDs that do support global brightness control in hardwa=
re
>> + * should instead set max_intensity to the maximum intensity value sup=
ported
>> + * by the hardware for a given color component.
>> + */
>>   struct mc_subled {
>>   	unsigned int color_index;
>>   	unsigned int brightness;
>>   	unsigned int intensity;
>> +	unsigned int max_intensity;
>>   	unsigned int channel;
>>   };
>>  =20
>> @@ -53,7 +74,14 @@ int led_classdev_multicolor_register_ext(struct devi=
ce *parent,
>>    */
>>   void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled=
_cdev);
>>  =20
>> -/* Calculate brightness for the monochrome LED cluster */
>> +/**
>> + * led_mc_calc_color_components() - Calculates component brightness va=
lues of a LED cluster.
>> + * @mcled_cdev - Multicolor LED class device of the LED cluster.
>> + * @led_brightness - Global brightness of the LED cluster.
> The header comment does not match the parameters.
>
> Make sure you compile with W=3D1 to catch kernel-doc issues.

Will do.

Thanks,
Armin Wolf

>> + * Calculates the brightness values for each color component of a mono=
chrome LED cluster,
>> + * see Documentation/leds/leds-class-multicolor.rst for details.
>> + */
>>   int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>>   				 enum led_brightness brightness);
>>  =20
>> --=20
>> 2.39.5
>>
>>

