Return-Path: <linux-leds+bounces-7468-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMjMHXT0wmnCnQQAu9opvQ
	(envelope-from <linux-leds+bounces-7468-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 21:30:44 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D47B931C59A
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 21:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D274430A692B
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 20:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE2634BA59;
	Tue, 24 Mar 2026 20:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qCNVnU+D"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDED8145A1F;
	Tue, 24 Mar 2026 20:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774384089; cv=none; b=r9fQDkcqMAfpm/X1maw0iYXkL3axzxNcpYulRbRSTxvmLf2wIapjF9n4EcnFrqAxBu70Bfm0brTDOw0D797rGnBeoI6UNLSuH0lcbeLCb+g4wf9yMtsWwA2yEn/SKZlGpp6UjZDiGEjB/5nUuHhtxNl9fml7LxTtTgDtiUviCoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774384089; c=relaxed/simple;
	bh=ghrJUdETe0A91EasxydvnXvuAPk7hbU0cXhOhuwh+5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kEorC44aUcBOHipCn59uMaSg1k4IZZzuKM1Fg5Cjmd94TFG53Z9zlTXSRzC9tp2lK/13DFXTPs7rwHv9lzJb+LoF467FkxwcDkZssAfADSQ/a2sS6htjwdad5akOv14HaHzZpr7fTZCjfQRTGN/LRw6WZ/1g+n/4h8YMLAzpz6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qCNVnU+D; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774384076; x=1774988876; i=w_armin@gmx.de;
	bh=5pcjCLEo7xCQbn8RM+2q8i879uCj2XFDhVYiQL4eavw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qCNVnU+D+ebBjPpII26tlVNGHDow/xKFTy7cuvRxR9eSoKlzCI+/cNs+46C3PmWi
	 r9bUZaYIacVQlj4K+JoAXE7NaPeeYot6ToKdduneQtwBO3cvN9KoFy9vcIidd83Tt
	 oWFyiypaDluKWuIIsyQ6tRAuABVsKIsoEPXgmH7d78PpkA56jBiHL2QYaOZZHLQ1o
	 mN+u1Ed+j0ReLXGEwUXQ8owlbo1UcTgnDNzAy9VaGH2Phfr+mGqproIfG1t7uVM38
	 jQ3PEnMeQTqJGuCfmRL3ms9xWGQF+BCEMBzPEGAfhx++6F4pAGgtqGYTRf5Va8OGI
	 8vE6J2ggvgvd+9+4nA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRTNF-1vtE6r12M1-00Ry6D; Tue, 24
 Mar 2026 21:27:56 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	wse@tuxedocomputers.com,
	jacek.anaszewski@gmail.com,
	pobrn@protonmail.com,
	m.tretter@pengutronix.de
Subject: [PATCH 1/1] leds: Introduce the multi_max_intensity sysfs attribute
Date: Tue, 24 Mar 2026 21:27:51 +0100
Message-Id: <20260324202751.6486-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260324202751.6486-1-W_Armin@gmx.de>
References: <20260324202751.6486-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OoPq3vHK+ydSD8Xj8ONZChEIAsg94MCQxxsPeF8hmH24+AtqtQ/
 D7lM2Sjdwh/nwR9bEy2eO/7ck0CxMJ4SAZpPafeQoVOAnRMfHJAkPXdkrFJJjvvm943dPg3
 7w2F+yTuC8HL1Fa2YWeU/IHbUEB+C2a7yYkctIsFILpOdFWnL54iiTeQXxgwOdo1x3KEA4f
 dxdNvndb1xO13R9bsf6gA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j8FLsShPjw4=;dk0Oh9luZvQGxDxQyvUViX0Sjpm
 9iHCuFQvff2S3V5OGEplLAJVxuseXGpk5wmusiUDzl++6c/Fy5df0keW9I513Od1+/ddw92H/
 wUhOxIbpm1xJokwu0QhccjhT/p011tkxnO3j2D2CYu5SauJrWyhE2trWqhIRGhciWDOtoppE8
 x4Ik8QHpHAoSiIrEnz+z+WXwwjUpMiFX48IGzYC+rBNV/mXLyrp/FA26LFbWfbByh4rWiAL4U
 FN3nyvPU0hXrZyonWm2ZQHs+3/2FCAo1jSjolJ4KEjMnDZgjAlhjnnBMMmNxee3Qkdpw5LUSR
 /ocVRuIrrStynAj3pfJmhJrj474ZrQgXPF2G1ujUDP1Gbm1IB6irYuR5vu3sDxfqzVHSDxuYw
 QmAsWNpAF5+1Tg3NKDnfPsMG4xXCu30QX/gg/LGw5qZJJ3nwmabJIpN4QhP9LALreUwrS6T4J
 Q7WSw5f7SBz8cK10IO5fzXaZtcIo2vqHxa4KIkCekkqkVvDONDtBJuVjDKFxnQysnMvsQJJ//
 Q1ZN03KtZbcdj2BXFhT1bN51cKSkwLYkBkfYF39xX2oEuvMNod4gLMz9tAFlPd6LvdaXaCfni
 7N6i6UQKeSFYnrcCZfzLAZvWeXbUmkJtoIrlSq8VV4qc7P5YkqdVJMGLR4u86MBc+msIAkhna
 pUiWmDUwvMDWgtSh5yJTP0X1VEkhhQtjsOed3w9yS26on1CO3lwynONRszH0FQ4VqPVfk4Z/r
 e5oC2hNo2fYV7Z3N+ssMSl48f/Viwokmf4QHV0xvbvPRqFBO5nt+hCYVXroXXC01vdSamSEDm
 uvxHfqzCfcf98dHJD4iTiBmaeARucqakp1RCjOZEt3ntTjWTBEkEPXGsN24UtI0qF8wE+b/xy
 dISezrYXmMtGQjUuz/B81EmCVGWL/MQ67KAdIuGBGXrO/nDkCLG169v5E/z8LzknoFTK5kEec
 e6DANJ+tm1ba/wI3cZiA1wwwtTnjzxCNDlVB2giF7qluUAM031rffuxIOTgnzUEEnHyw84G5m
 k/LyJ+aAI4RjyPxBGEXEhvKYr9LNc1O/YWz2CRpv5a8jLCQ+KMv3M9eG0AneTyFizceHfNWeH
 I6TFBdmhjfGS9BkihplO5fXz8ftAh3JNCJ5eHLpYxXXe1sJerHywEl5lNeDC1RB57fvnmrFqU
 /q2yRXIQ/CZgHZyKe5egMg9jFnKP7uMzWfIRjl2dAWQ08qB4Vlrp4Pfa+v9falSWp+pdP7B1H
 SrjGoDYaFD6fur8E5b0iRgPJrnuM3auWcmMk42P6Q/6ktCe92GwGAMqJ9I5GUEXDcciOVd/rI
 q4SPdUbnuGmX0M2cbfo9wIFZWELyZAF+XlpcK5KdGp8OtHDGpGwcf8E200QScIEgMAlD09CfE
 35S0pWY44ptou56UUhUHqE4LygSMe9m52DCd7lNIT+UZsT42hRje/1M3xsPgkSTLF3zjb9DCL
 MxczdGhKn19VpYUqYF/VIip6QC9ieRsZ6ksuMGTZ6kp90PRypiYoJghWV2iYf+WuLwvfzp6An
 qNc3NLbn4j43jHvfihkdKV0mf/y2yj7Yo1Lo2Zv9n0s35MuJgFRTDlZCROKQMd6eh+6iGG8tr
 PW5v5BXwc/+WNStr3IoBF6usld9uLdqSxPONSRUFVo3C7PER4T+Ce4UObYCp19Jn+HgYrYWpy
 vh2fVLy5VP1l6MxZMdzFz3ccgsm7AVp5p9ucyKtV/KNw18zlvPUIJtzkmIJZWI8IoNrgpMHOw
 Hs3IFpNNju7z+pQNxMDcR5tHWJF4JwgQTV73Te1fbtedGlLcR/mAnD0sTKD5AlsVisPWik8XG
 /EwxK4Ceexxby1hKaHCYyinzbCVaOc4lgu2mX9N0O3CwsoKip/L9ZfVX70GSQ05YfP7kHDnz0
 QHlp33a4fnw/zS8dnGso4GyAFtZbCrh+Ze/8AjmQ7A2UgFGhDJflsEmL7LGKXJ6ZxXsjYP77k
 A20vxZ3K+Gd5sq0TN0M0bc7rt8gJR8A3NIEQeMd9t6SX5sjA1u3APGPbaqx71Clp24Wrdh6ES
 zaCV6lxUi4kjt5Up47EFNbwXsGUwuqd6stdS0RTNlrzrSU/x3SvhDYsUdZH7P23G/ujfbWIzK
 AWyuhRF2NaY6f574rON1T9Yhwwbwvvn0fEpWqViqQHLxi/Zwt5pm/MmBPR+DEFk5gBA/imnnV
 wBnmSNs09uRtOFA38xxElnezUqbpL1bVaTXSxKPAWpaFhZzBNJMHmq9pKbLMHftU4uoe0z9p8
 Z16UMBAgL+epxUUlpoMA0MbBj51C00axhKQe1voZ0sWO260lhuNsh2D4aCB1/ibTBq3fp/iXA
 M7lyEocPtatgfLSO2GWzE3Uzj/Dd2YwCGfmGKKBHtenxCgBjG/4CTFMbcRTogyUZqPpf4FY41
 Hc0/n8Uu068zIMmVSf2WSaeHMiEI6HB/47wmLidEbBL1XGIIVITGEmDdxnf1Z1dF2cuyNzDrc
 E96u+y7knU7QCRQZ1hh7H6A3CYTDhNbrrPN5zApsWPETsskg6UrkbJ7YcEE2zPFU6JXHbn4ll
 gHJ6g9292LV/CjoNBqTv48PBOjQmiiqXriQZ/Vtcr5zAnY/53y4Km7uLxth/U2Nc188FcEfON
 T07NTG8xVzO86lIdQDGVtS/DqrSktUO6h3rsF5Rca51v55Qy11WYSBJfRL205veTWgYRWEwbo
 NL71NDJjNXBdlQxI8vBNI955/8l00iP0b0Ola7V/gRmihfg2CS5v3Em2WQjkP56suqkkbQFZD
 WkfR30smY6f0o0LeQ/jZ6rzU7YC8mnT7nrMRDgGfnDE5HTdGpJ1hir77piBgEsDTKZk5AdaLF
 ZS2YhWnBn87UB7iygwGFs0Bx7IPhUwM5VzhGYG81DEbZ1t0JRUKC9XTo80/HRkqrDYcTaL9ze
 6U59OhCAmEFlLMoZgG9Q+GmKDepsMozRBmm4X7JQMchFJJ872osG5BKKTqpKmVGWmmfGlybHs
 +gEVCFjxKvPLsTjc8f9bHxWqSUR+bMQZWk2j+dpBIqE9MezNtqgDpenwj3IzmLn2hqP7GEUNB
 DcnhAsjAZsn5evmAPsqU2hlWdvaOSdeQe2l1TRMwcoqy0+vzgzXSuT4OJFAHKKRPEZ1ngLFa4
 8kwd8AW8d5yaV3dnfhaDBky/vj7Wo8ndZsYlpYeZBec7GvjUSfFr+HGv4eLd+jh6x4dHrF0bX
 CwvpaXswVUtZqdZK2rGSDWYrdOBjWumzrcFVak1T/B9QK4ufUkWY4FrsuR0ufoeTpd4IZwYw/
 4D2tW3SrnzHG1iq4lkTjUAIySzURg6DYFmCReFWI3WOw+lqPVZI+azHEjQCag4gMOWmRzvcGK
 s/ukMwXMSRYAGKkZK7hi1bjybrOyrTMQUMpxQ+K49i1Q3Hfc3bO/XDqCzEdcsjfp67cCvT80j
 OwU/6mDJKrxK6SPsb+nJhsp929r/6YGVDsPnvZoUqVe6NlxtlAhgbeDVdCH1ZcClDbQGLmTGN
 x7ObOEmV2y3D2mkI8tqagL/OjHJVeObR5n2PHwdXuMvIfdOl4ziecld43Pz8Y4RZhWmFUDy62
 zp2JfJWDHBVx6WZFMqDDhJ0Q5GEAr7ztXKvf2qanlLRgtxZy2OzsScTFsxaADZJqV/0nGkZdy
 R3jfJR8teJbldW1sw/YdJXBTMeFA7nvv/DCj4LYzSKuS0WuBihqB7BpwTYfn8uzcb/gdrJYH0
 3K0II98bVCqyg0EJ+GUCQUHOmHUbCrZWJI1n+c7G+11Fjk8ZPiOOuF5gbX+Ql3aB+pTnUdxQo
 W6Bls3Ks3FcInbIiqS5BmL9JWj2fI2MVO4+1DSvC8mYd5fZ16sRxId3SOPOEG3ODyrL5Gvs5E
 h4IhCVMlEJCq5jI8X5bsN3DE92Xv/YS6fpm9kJ//TKq3AEiCnxottoQYjZuhSP2bvmO3usnFh
 RCF8Q6YIGicwBW34pV1aMXXLTS5r3NfxThgk2VqT7QKmzmbJCvyr7yycOfwGQJ2ydW5FYCu8R
 tLdzvMIqH5J+jZv9ME6WSLPc3p3kWGh3SUOfY7mqdGmF2EbvhavOMe9JrOAEeQrio+TA7R+ab
 Fbp/7mFxlPmEI7lrBCp7SgW/AdvtxPwpSMvmjQ6FpkJkzmOxtyEhqihyur5FpW2kdTrTxXve9
 +hsrHC2RXtAeElY3dHPz/XS6W+Q2mvFjXp5gcJJ94q0aA2tT/05WHlbSPJeSLF2bKEBzBayK3
 KDjbh1DBjgGTJ4aGxNJhPVGabReOZgqiRyoFdzUfm+V257gx3XUhxAZJ5l79gyLBlHJ2q8Qal
 pjy9MpjxNa3OR4DenCKKqyUZbDfQWlpoHVDDKEtMPcSPWVUUL0U2R+F/6NbMwqbMysITEXHN5
 MJ0D/0Z96oSGUdSUHKoGfk1UJcv97CD/32KkaStwIikAaX9MBDF+M0qsRy3Wl5vofH1hWwjxU
 4z+PU8e7GDjh+HQxUP7zCXwXc50sK2EvMj/Dmhamgk0JM/wMoHPnOTNn+6mfkjJ7QzjlBt88D
 Z01H1v+WdLL7z9/dB9uzdqzjIV3rBMmevGm0+0bcW655TbNqAV26F1k5pNU4us60eyiZ3MTpE
 R18AVAU6kpSc3ayYPS2DHes61f/iXA4JJTIMWhHB3oqGNh7hK5HgVoAmxJ7Uh95JvkrvuutVy
 Unp9UwmdglDoRub6Mb9uZ3GZ6c3tFVRvM/T/2akO9+bFx15sU9/C6KK+4ITMRY8L8h5B6LgIT
 tne0ni5edIQlIrNGdOuFOlt0l0BwhgZYHFGaS/YaT/g8Ff+1ryPjizd1GM9ZrPSvnBgdyBsHs
 ZeXKE89uYUl6Y2jdOYMeag+ADOrur3yNF54/ljbENwzEc1NYl7NT8wpSIhRhgWvxmL7Px4V/X
 wSuBfsGG3f0iApvnofOor+htkfZS3iHIC8h2L5oEWdlOsf866N/kp7jpxLGqr3I16lVUFvZzK
 aVMWkdXBJLkq4ZICy0m5MdFnXwZ+gvnlzbKFvKANrkJcRq2rQ33Rt0lsS9YrbRuWpLSSHHXKo
 PuiPO1lcxNN87/PgPjqBzEX/lvlVyGSwoyIxoLvbhx/RhQwutknG2LE1uI8MnB2Y6G3OLFV5q
 F3okAXh+S0tvLdLqD0Jd1ci3L8TnpCSLOQAR1Xo0umNotxcMZy9L60No0z83ugD3HtJHuKnT/
 lI2ZoIsIrOCfGGig9kiuDz0v+Hr2f9U0WUkiwZPzBgTBPCmIuuRwbUYObh52oHLOQPo5VbKWD
 0+OQpZHT46br7AxgGxIlMjuT6TfkesS9x6qY28WUC7EZw3VbjgSa5bmBvj2w96Y1G6S3d614A
 88a0V9ttLGJFZ4dBdqLuROkFRGumClXRsl4XsrVNhKWEQSvq3A5y8QIDjRUEXJPAYssA4VoIy
 0VBAAfJVV/bejYAWiJ/DcxoMauopmQMRrpG+mCtu3QGmzoMzuD6+ObMsd/VgeFMj23JKQxvSS
 /TGUmHGdWyXenDEGmkSCuzUwz5VUrz5x+G2B0dBS8cYY6SW/2Rn69k9sIE3sx8e+H6Y2rfbVs
 X4aQDC6desqrLwZT9Y0AW+UIT1BKXE8vdlz0=
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,linuxfoundation.org,tuxedocomputers.com,gmail.com,protonmail.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7468-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D47B931C59A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some multicolor LEDs support global brightness control in hardware,
meaning that the maximum intensity of the color components is not
connected to the maximum global brightness. Such LEDs cannot be
described properly by the current multicolor LED class interface,
because it assumes that the maximum intensity of each color component
is described by the maximum global brightness of the LED.

Fix this by introducing a new sysfs attribute called
"multi_max_intensity" holding the maximum intensity values for the
color components of a multicolor LED class device. Drivers can use
the new max_intensity field inside struct mc_subled to tell the
multicolor LED class code about those values. Intensity values written
by userspace applications will be limited to this maximum value.

Drivers for multicolor LEDs that do not support global brightness
control in hardware might still want to use the maximum global LED
brightness supplied via devicetree as the maximum intensity of each
individual color component. Such drivers should set max_intensity
to 0 so that the multicolor LED core can act accordingly.

The lp50xx and ncp5623 LED drivers already use hardware-based control
for the global LED brightness. Modify those drivers to correctly
initalize .max_intensity to avoid being limited to the maximum global
brightness supplied via devicetree.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../ABI/testing/sysfs-class-led-multicolor    | 19 ++++++--
 Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++-
 drivers/leds/led-class-multicolor.c           | 47 ++++++++++++++++++-
 drivers/leds/leds-lp50xx.c                    |  1 +
 drivers/leds/rgb/leds-ncp5623.c               |  4 +-
 include/linux/led-class-multicolor.h          | 30 +++++++++++-
 6 files changed, 113 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Docume=
ntation/ABI/testing/sysfs-class-led-multicolor
index 16fc827b10cb..197da3e775b4 100644
=2D-- a/Documentation/ABI/testing/sysfs-class-led-multicolor
+++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
@@ -16,9 +16,22 @@ Date:		March 2020
 KernelVersion:	5.9
 Contact:	Dan Murphy <dmurphy@ti.com>
 Description:	read/write
-		This file contains array of integers. Order of components is
-		described by the multi_index array. The maximum intensity should
-		not exceed /sys/class/leds/<led>/max_brightness.
+		This file contains an array of integers. The order of components
+		is described by the multi_index array. The maximum intensity value
+		supported by each color component is described by the multi_max_intensi=
ty
+		file. Writing intensity values larger than the maximum value of a
+		given color component will result in those values being clamped.
+
+		For additional details please refer to
+		Documentation/leds/leds-class-multicolor.rst.
+
+What:		/sys/class/leds/<led>/multi_max_intensity
+Date:		March 2026
+KernelVersion:	7.1
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:	read
+		This file contains an array of integers describing the maximum
+		intensity value for each intensity component.
=20
 		For additional details please refer to
 		Documentation/leds/leds-class-multicolor.rst.
diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/=
leds/leds-class-multicolor.rst
index c6b47b4093c4..8f42f10078ad 100644
=2D-- a/Documentation/leds/leds-class-multicolor.rst
+++ b/Documentation/leds/leds-class-multicolor.rst
@@ -25,10 +25,14 @@ color name to indexed value.
 The ``multi_index`` file is an array that contains the string list of the=
 colors as
 they are defined in each ``multi_*`` array file.
=20
-The ``multi_intensity`` is an array that can be read or written to for th=
e
+The ``multi_intensity`` file is an array that can be read or written to f=
or the
 individual color intensities.  All elements within this array must be wri=
tten in
 order for the color LED intensities to be updated.
=20
+The ``multi_max_intensity`` file is an array that contains the maximum in=
tensity
+value supported by each color intensity. Intensity values above this will=
 be
+automatically clamped into the supported range.
+
 Directory Layout Example
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 .. code-block:: console
@@ -38,6 +42,7 @@ Directory Layout Example
     -r--r--r--    1 root     root          4096 Oct 19 16:16 max_brightne=
ss
     -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_index
     -rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_intens=
ity
+    -r--r--r--    1 root     root          4096 OCt 19 16:16 multi_max_in=
tensity
=20
 ..
=20
@@ -104,3 +109,17 @@ the color LED group.
     128
=20
 ..
+
+Writing intensity values larger than the maximum specified in ``multi_max=
_intensity``
+will result in those values being clamped into the supported range.
+
+.. code-block:: console
+
+   # cat /sys/class/leds/multicolor:status/multi_max_intensity
+   255 255 255
+
+   # echo 512 512 512 > /sys/class/leds/multicolor:status/multi_intensity
+   # cat /sys/class/leds/multicolor:status/multi_intensity
+   255 255 255
+
+..
diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-=
multicolor.c
index 6b671f3f9c61..13a35e6a28df 100644
=2D-- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -7,10 +7,28 @@
 #include <linux/init.h>
 #include <linux/led-class-multicolor.h>
 #include <linux/math.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
=20
+static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcle=
d_cdev, size_t index)
+{
+	unsigned int max_intensity;
+
+	/* The maximum global brightness value might still be changed by
+	 * led_classdev_register_ext() using devicetree properties. This
+	 * prevents us from changing subled_info[X].max_intensity when
+	 * registering a multicolor LED class device, so we have to do
+	 * this during runtime.
+	 */
+	max_intensity =3D mcled_cdev->subled_info[index].max_intensity;
+	if (max_intensity)
+		return max_intensity;
+
+	return mcled_cdev->led_cdev.max_brightness;
+}
+
 int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
 				 enum led_brightness brightness)
 {
@@ -27,6 +45,27 @@ int led_mc_calc_color_components(struct led_classdev_mc=
 *mcled_cdev,
 }
 EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
=20
+static ssize_t multi_max_intensity_show(struct device *dev,
+					struct device_attribute *intensity_attr, char *buf)
+{
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
+	unsigned int max_intensity;
+	int len =3D 0;
+	int i;
+
+	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
+		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
+		len +=3D sprintf(buf + len, "%u", max_intensity);
+		if (i < mcled_cdev->num_colors - 1)
+			len +=3D sprintf(buf + len, " ");
+	}
+
+	buf[len++] =3D '\n';
+	return len;
+}
+static DEVICE_ATTR_RO(multi_max_intensity);
+
 static ssize_t multi_intensity_store(struct device *dev,
 				struct device_attribute *intensity_attr,
 				const char *buf, size_t size)
@@ -35,6 +74,7 @@ static ssize_t multi_intensity_store(struct device *dev,
 	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
 	int nrchars, offset =3D 0;
 	unsigned int intensity_value[LED_COLOR_ID_MAX];
+	unsigned int max_intensity;
 	int i;
 	ssize_t ret;
=20
@@ -56,8 +96,10 @@ static ssize_t multi_intensity_store(struct device *dev=
,
 		goto err_out;
 	}
=20
-	for (i =3D 0; i < mcled_cdev->num_colors; i++)
-		mcled_cdev->subled_info[i].intensity =3D intensity_value[i];
+	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
+		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
+		mcled_cdev->subled_info[i].intensity =3D min(intensity_value[i], max_in=
tensity);
+	}
=20
 	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
 		led_set_brightness(led_cdev, led_cdev->brightness);
@@ -111,6 +153,7 @@ static ssize_t multi_index_show(struct device *dev,
 static DEVICE_ATTR_RO(multi_index);
=20
 static struct attribute *led_multicolor_attrs[] =3D {
+	&dev_attr_multi_max_intensity.attr,
 	&dev_attr_multi_intensity.attr,
 	&dev_attr_multi_index.attr,
 	NULL,
diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index e2a9c8592953..69c3550f1a31 100644
=2D-- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -525,6 +525,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 			}
=20
 			mc_led_info[multi_index].color_index =3D color_id;
+			mc_led_info[multi_index].max_intensity =3D 255;
 			num_colors++;
 		}
=20
diff --git a/drivers/leds/rgb/leds-ncp5623.c b/drivers/leds/rgb/leds-ncp56=
23.c
index 85d6be6fff2b..f2528f06507d 100644
=2D-- a/drivers/leds/rgb/leds-ncp5623.c
+++ b/drivers/leds/rgb/leds-ncp5623.c
@@ -56,8 +56,7 @@ static int ncp5623_brightness_set(struct led_classdev *c=
dev,
 	for (int i =3D 0; i < mc_cdev->num_colors; i++) {
 		ret =3D ncp5623_write(ncp->client,
 				    NCP5623_PWM_REG(mc_cdev->subled_info[i].channel),
-				    min(mc_cdev->subled_info[i].intensity,
-					NCP5623_MAX_BRIGHTNESS));
+				    mc_cdev->subled_info[i].intensity);
 		if (ret)
 			return ret;
 	}
@@ -190,6 +189,7 @@ static int ncp5623_probe(struct i2c_client *client)
 			goto release_led_node;
=20
 		subled_info[ncp->mc_dev.num_colors].channel =3D reg;
+		subled_info[ncp->mc_dev.num_colors].max_intensity =3D NCP5623_MAX_BRIGH=
TNESS;
 		subled_info[ncp->mc_dev.num_colors++].color_index =3D color_index;
 	}
=20
diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-clas=
s-multicolor.h
index db9f34c6736e..26f6d20b887d 100644
=2D-- a/include/linux/led-class-multicolor.h
+++ b/include/linux/led-class-multicolor.h
@@ -9,10 +9,31 @@
 #include <linux/leds.h>
 #include <dt-bindings/leds/common.h>
=20
+/**
+ * struct mc_subled - Color component description.
+ * @color_index: Color ID.
+ * @brightness: Scaled intensity.
+ * @intensity: Current intensity.
+ * @max_intensity: Maximum supported intensity value.
+ * @channel: Channel index.
+ *
+ * Describes a color component of a multicolor LED. Many multicolor LEDs
+ * do no support gobal brightness control in hardware, so they use
+ * the brightness field in connection with led_mc_calc_color_components()
+ * to perform the intensity scaling in software.
+ * Such drivers should set max_intensity to 0 to signal the multicolor LE=
D core
+ * that the maximum global brightness of the LED class device should be u=
sed for
+ * limiting incoming intensity values.
+ *
+ * Multicolor LEDs that do support global brightness control in hardware
+ * should instead set max_intensity to the maximum intensity value suppor=
ted
+ * by the hardware for a given color component.
+ */
 struct mc_subled {
 	unsigned int color_index;
 	unsigned int brightness;
 	unsigned int intensity;
+	unsigned int max_intensity;
 	unsigned int channel;
 };
=20
@@ -53,7 +74,14 @@ int led_classdev_multicolor_register_ext(struct device =
*parent,
  */
 void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cde=
v);
=20
-/* Calculate brightness for the monochrome LED cluster */
+/**
+ * led_mc_calc_color_components() - Calculates component brightness value=
s of a LED cluster.
+ * @mcled_cdev - Multicolor LED class device of the LED cluster.
+ * @led_brightness - Global brightness of the LED cluster.
+ *
+ * Calculates the brightness values for each color component of a monochr=
ome LED cluster,
+ * see Documentation/leds/leds-class-multicolor.rst for details.
+ */
 int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
 				 enum led_brightness brightness);
=20
=2D-=20
2.39.5


